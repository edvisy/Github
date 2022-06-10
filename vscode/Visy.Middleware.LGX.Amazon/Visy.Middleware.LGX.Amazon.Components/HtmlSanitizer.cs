using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.Amazon.Components
{
    [Serializable()]
    public class HtmlSanitizer
    {
        private readonly IDictionary<string, string[]> Whitelist;
        private List<string> DeletableNodesXpath = new List<string>();

        public  HtmlSanitizer()
        {
            Whitelist = new Dictionary<string, string[]> {
                { "a", new[] { "href" } },
                { "strong", null },
                { "em", null },
                { "blockquote", null },
                { "b", null},
                { "p", null},
                { "ul", null},
                { "ol", null},
                { "li", null},
                { "div", new[] { "id" } },
                { "strike", null},
                { "u", null},
                { "sub", null},
                { "sup", null},
                { "table", new[] { "id" } },
                { "tr", null },
                { "td", null },
                { "th", null },
                { "body", null },
                { "html", null },
                { "span", null }

                };
        }

        public string Sanitize(string input)
        {
            if (input.Trim().Length < 1)
                return string.Empty;
            var htmlDocument = new HtmlDocument();

            htmlDocument.LoadHtml(input);

            htmlDocument.DocumentNode.Descendants()
                 .Where(n => n.NodeType == HtmlAgilityPack.HtmlNodeType.Comment)
                 .ToList()
                 .ForEach(n => n.Remove());

            SanitizeNode(htmlDocument.DocumentNode);
            string xPath = CreateXPath();

            return StripHtml(htmlDocument.DocumentNode.WriteTo().Trim(), xPath);
        }

        private void SanitizeChildren(HtmlNode parentNode)
        {
            for (int i = parentNode.ChildNodes.Count - 1; i >= 0; i--)
            {
                SanitizeNode(parentNode.ChildNodes[i]);
            }
        }

        private void SanitizeNode(HtmlNode node)
        {
            if (node.NodeType == HtmlNodeType.Element)
            {
                if (!Whitelist.ContainsKey(node.Name))
                {
                    if (!DeletableNodesXpath.Contains(node.Name))
                    {                       
                        node.Name = "removeableNode";
                        DeletableNodesXpath.Add(node.Name);
                    }
                    if (node.HasChildNodes)
                    {
                        SanitizeChildren(node);
                    }

                    return;
                }

                if (node.HasAttributes)
                {
                    for (int i = node.Attributes.Count - 1; i >= 0; i--)
                    {
                        HtmlAttribute currentAttribute = node.Attributes[i];
                        string[] allowedAttributes = Whitelist[node.Name];
                        if (allowedAttributes != null)
                        {
                            if (!allowedAttributes.Contains(currentAttribute.Name))
                            {
                                node.Attributes.Remove(currentAttribute);
                            }
                        }
                        else
                        {
                            node.Attributes.Remove(currentAttribute);
                        }
                    }
                }
            }

            if (node.HasChildNodes)
            {
                SanitizeChildren(node);
            }
        }

        private string StripHtml(string html, string xPath)
        {
            HtmlDocument htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(html);
            if (xPath.Length > 0)
            {
                HtmlNodeCollection invalidNodes = htmlDoc.DocumentNode.SelectNodes(@xPath);
                foreach (HtmlNode node in invalidNodes)
                {
                    node.ParentNode.RemoveChild(node, true);
                }
            }
            return htmlDoc.DocumentNode.WriteContentTo(); ;
        }

        private string CreateXPath()
        {
            string _xPath = string.Empty;
            for (int i = 0; i < DeletableNodesXpath.Count; i++)
            {
                if (i != DeletableNodesXpath.Count - 1)
                {
                    _xPath += string.Format("//{0}|", DeletableNodesXpath[i].ToString());
                }
                else _xPath += string.Format("//{0}", DeletableNodesXpath[i].ToString());
            }
            return _xPath;
        }
    }
}
