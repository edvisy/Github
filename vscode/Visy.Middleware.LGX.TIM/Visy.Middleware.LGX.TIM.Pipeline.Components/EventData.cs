using System;
using System.Collections.Generic;
using System.Text;

namespace Visy.Middleware.LGX.TIM.PipelineComponents
{
    public class EventData
    {
        /// <summary>
        /// Source of Event Log entries generated by this pipeline component.
        /// </summary>
        public const string EVENT_LOG_SOURCE = "MessageArchiver";

        #region Enumerations

        /// <summary>
        /// Macro validation error id's
        /// </summary>
        public enum MacroValidation
        {
            MacroIdentifierCountMismatch = 4010,
            MacroNotFound = 4020
        }

        /// <summary>
        /// Context Property validation Event Id's
        /// </summary>
        public enum ContextPropertyValidation
        {
            ContextPropertyNotFound = 5010,
        }

        /// <summary>
        /// Configuration file validation Event Id's
        /// </summary>
        public enum MacroDefinitionsFileValidation
        {
            BlankConfigurationFilename = 6010,
            GeneralXsdValidationError = 6020,
            InvalidConfigurationFilename = 6030
        }

        /// <summary>
        /// Pipeline Component Failure Event Id's
        /// </summary>
        public enum PipelineComponentFailures
        {
            StreamFailedToRewind = 7010
        }

        /// <summary>
        /// Archiving file write failure Event Id's
        /// </summary>
        public enum ArchiveFileWriteFailures
        {
            ArchiveFileFailedToWrite = 8010,
            GeneralExceptionWritingArchiveFile = 8020,
            EventArgsAreNull = 8030,
            ArchiveDirectoryNotSet = 8040,
            ArchiveFilenameNotSet = 8050
        }

        /// <summary>
        /// BizTalk Message Validation Event Id's
        /// </summary>
        public enum BizTalkMessageValidation
        {
            BodyPartIsNull = 9010
        }

        #endregion
    }
}
