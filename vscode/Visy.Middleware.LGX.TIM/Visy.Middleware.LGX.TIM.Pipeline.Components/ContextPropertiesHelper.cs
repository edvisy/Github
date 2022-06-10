//---------------------------------------------------------------------
//   
// Copyright (c) 2008 Modhul Ltd.  All rights reserved.
//   
// The use and distribution terms for this software are contained in the file
// named license.txt, which can be found in the root of this distribution.
// By using this software in any fashion, you are agreeing to be bound by the
// terms of this license.
//   
// You must not remove this notice, or any other, from this software.
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
// PURPOSE.
//   
//---------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml;
using Microsoft.BizTalk.Message.Interop;
using System.Reflection;

namespace Visy.Middleware.LGX.TIM.PipelineComponents
{
    internal static class ContextPropertiesHelper
    {

        #region Constants

        /// <summary>
        /// Macro Defintions Xml Configuration Schema.
        /// </summary>
        private const string MACRO_DEFINITION_SCHEMA_NS = "http://schemas.modhul.com/BizTalk/Pipeline/Components/Archive";

        #endregion

        /// <summary>
        /// Returns a string updated with with message context macros.
        /// </summary>
        /// <param name="baseMessage">Message Part from which to retrieve context properties.</param>
        /// <param name="macroPathProperty">The macro path property detailing the required macro substitutions.</param>
        /// <param name="macroDefsFile">Path to the Macro Definitions configuration file.</param>
        /// <returns>String containing an updated Macro Path Property value.</returns>
        internal static string UpdateMacroPathProperty(IBaseMessage baseMessage, string macroPathProperty)
        {
            // Only update message context macros where the macro identifier ('%') is present.
            if (macroPathProperty.Contains("%"))
            {
                // Define Macro Regular Expression.
                const string macroRegex = @"(%)((?:\w+))(%)";

                // Find regex macro matches within the supplied string.
                Regex regex = new Regex(macroRegex, RegexOptions.IgnoreCase | RegexOptions.Singleline);
                MatchCollection macroMatchCollection = regex.Matches(macroPathProperty);

                // Iterate through each macro match, retrieve the context property value and 
                // update the supplied string. If the context property value cannot be found,
                // the macro will not be updated.
                foreach (Match macroMatch in macroMatchCollection)
                {
                    string macroName = macroMatch.Groups[2].Value;
                    string contextPropertyValue;

                    // If %MessageID% macro, retrieve directly from the message itself;
                    // Otherwise, attempt to get the property context value from the 
                    // message context.
                    switch (String.Compare(macroName, "MessageID", true))
                    {
                        case 0:
                            contextPropertyValue = baseMessage.MessageID.ToString();
                            break;
                        default:
                            contextPropertyValue = GetContextPropertyValue(baseMessage.Context, macroName);
                            break;
                    }

                    // Replaces a macro with supplied Context Property value if the Context 
                    // Property value is not empty. If empty, no action is taken.
                    if (contextPropertyValue != String.Empty)
                    {
                        macroPathProperty = macroPathProperty.Replace(String.Format("%{0}%", macroName), contextPropertyValue);
                    }
                }
            }

            return (macroPathProperty);
        }

        /// <summary>
        /// Gets the property context value based on the supplied macro name.
        /// </summary>
        /// <param name="messageContext">Context of the message part.</param>
        /// <param name="macroName">Name of the macro to be retreived.</param>
        /// <param name="macroDefsFile">Path to the Macro Definitions configuration file.</param>
        /// <returns>String containing the context property value.</returns>
        private static string GetContextPropertyValue(IBaseMessageContext messageContext, string macroName )
        {

            string contextProperty = String.Empty;
            string contextPropertyValue = String.Empty;
            
            // Load the Macro Definitions configuration file.
            XmlDocument macroDefinitionsConfig = new XmlDocument();
            XmlNamespaceManager nsManager = new XmlNamespaceManager(macroDefinitionsConfig.NameTable);

            // Load the Macro Definitions configuration file for parsing.
            try
            {
                // We are loading the Configuration from the embedded Resource File - MacroDefinitions.xml, rather than the file system
                string resourceName = "Visy.ECommerce.TIM.PipelineComponents.MessageArchiver.MacroDefinitions.xml";

                Stream memStream = Assembly.GetExecutingAssembly().GetManifestResourceStream(resourceName);
                memStream.Seek(0, SeekOrigin.Begin);

                XmlTextReader reader = new XmlTextReader(memStream);

                macroDefinitionsConfig.Load(reader);
                nsManager.AddNamespace("m", MACRO_DEFINITION_SCHEMA_NS);
            }
            catch (Exception)
            {
                System.Diagnostics.EventLog.WriteEntry(EventData.EVENT_LOG_SOURCE, "Failed to open Macro Defintion Xml Configuration file from embedded resource.", EventLogEntryType.Error, (int)EventData.MacroDefinitionsFileValidation.InvalidConfigurationFilename );
            }

            // Retrieve details of the specified macro.
            XmlNode macroNode = macroDefinitionsConfig.SelectSingleNode("/m:Macros/m:Macro[@name='" + macroName + "']", nsManager);

            if (macroNode != null)
            {
                // Retrieve the context property name and namespace relating to this macro.
                contextProperty = macroNode.SelectSingleNode("m:ContextProperty", nsManager).InnerText;
                string contextPropertyNamespace = macroNode.SelectSingleNode("m:ContextPropertyNamespace", nsManager).InnerText;

                // Attempt to read the Property Context value.
                try
                {
                    contextPropertyValue = messageContext.Read(contextProperty, contextPropertyNamespace).ToString();
                }
                catch (Exception)
                {
                    System.Diagnostics.EventLog.WriteEntry(EventData.EVENT_LOG_SOURCE, "Could not retrieve the context property " + contextProperty + " using the namespace " + contextPropertyNamespace + " - the Context Property does not exist in the message. Please check the context property name and namespace in the pipeline component configuration", EventLogEntryType.Error, (int)EventData.ContextPropertyValidation.ContextPropertyNotFound);
                }
            }
            else
            {
                // Macro was not located in the Xml configuration file.
                System.Diagnostics.EventLog.WriteEntry(EventData.EVENT_LOG_SOURCE, "Could not locate the macro " + macroName + " in the Xml configuration file. Please check the macro name in the pipeline component configuration. The message will be passed to BizTalk and will be archived, but will not have this macro included.", EventLogEntryType.Error, (int)EventData.MacroValidation.MacroNotFound);
            }

            return (CleanSpecialContextPropertyValues(contextProperty, contextPropertyValue));
        }

        /// <summary>
        /// Cleans Context Property values that may not be in the exact form required.
        /// </summary>
        /// <param name="contextProperty">The Context Property name.</param>
        /// <param name="contextPropertyValue">The Context Property value to be 'cleaned'.</param>
        /// <returns>String containing the 'cleaned' Context Property value.</returns>
        private static string CleanSpecialContextPropertyValues(string contextProperty, string contextPropertyValue)
        {
            if (contextPropertyValue == String.Empty)
            {
                return (contextPropertyValue);
            }

            switch (contextProperty)
            {
                case "ReceivedFileName":
                    return (Path.GetFileNameWithoutExtension(contextPropertyValue));
                case "OriginalMessageId":
                    return (MakeValidWin32FileName(contextPropertyValue));
                case "MessageType":
                    return (MakeValidWin32FileName(GetRootNode(contextPropertyValue)));
                default:
                    return (contextPropertyValue);
            }
        }

        private static string MakeValidWin32FileName(string input)
        {
            //string invalidChars = String.Join("", Path.GetInvalidFileNameChars());
            string pattern = @"[:*?" + Convert.ToChar(34) + @"<>]";
            return Regex.Replace(input, pattern, "", RegexOptions.IgnoreCase);
        }

        private static string GetRootNode(string messageType)
        {
            if (messageType.IndexOf("#") != -1)
            {
                return messageType.Substring(messageType.IndexOf("#") + 1);
            }
            else
            {
                return messageType;
            }
        }
    }
}
