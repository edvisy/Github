using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Visy.Middleware.LGX.Orders.DelimitedFF.PipelineComponents
{
    public class DelimitedFileReader : StreamReader
    {
        public DelimitedFileReader(Stream stream)
            : base(stream)
        { }

        public DelimitedFileReader(string filename)
            : base(filename)
        { }



        public bool ReadRow(DelimitedRow row, char columnDelimiter, string rowDelimiter)
        {
            row.LineText = ReadLine();

            if (String.IsNullOrEmpty(row.LineText))
                return false;

            int pos = 0;
            int rows = 0;

            while (pos < row.LineText.Length)
            {
                string value;

                if (row.LineText[pos] == '"')
                {
                    pos++;

                    int start = pos;
                    while (pos < row.LineText.Length)
                    {
                        if (row.LineText[pos] == '"')
                        {
                            pos++;

                            if (pos >= row.LineText.Length || row.LineText[pos] != '"')
                            {
                                pos--;
                                break;
                            }
                        }
                        pos++;
                    }
                    value = row.LineText.Substring(start, pos - start);
                    value = value.Replace("\"\"", "\"");
                }
                else
                {
                    int start = pos;
                    while (pos < row.LineText.Length && row.LineText[pos] != columnDelimiter)
                        pos++;
                    value = row.LineText.Substring(start, pos - start);
                }

                if (rows < row.Count)
                    row[rows] = value;
                else
                    row.Add(value);
                rows++;

                while (pos < row.LineText.Length && row.LineText[pos] != columnDelimiter)
                    pos++;
                if (row.Count > rows)
                    row.RemoveAt(rows);

                pos++;
            }

            while (row.Count > rows)
                row.RemoveAt(rows);

            return (row.Count > 0);
        }

        public List<DelimitedRow> ReadRows(char columnDelimiter, string rowDelimiter)
        {
            List<DelimitedRow> rows = new List<DelimitedRow>();
            DelimitedRow row;

            while (this.ReadRow(row = new DelimitedRow(), columnDelimiter, rowDelimiter))
            {
                //foreach (string s in row)
                //{
                //    Console.Write(s);
                //    Console.Write(" ");
                //}
                //Console.WriteLine();

                rows.Add(row);
            }

            Console.WriteLine("Number of rows: {0}", rows.Count);
            Console.WriteLine("Press any key to create LGX Order");
            Console.Read();

            return rows;
        }
    }

    public class DelimitedRow : List<string>
    {
        public string LineText { get; set; }
    }
}
