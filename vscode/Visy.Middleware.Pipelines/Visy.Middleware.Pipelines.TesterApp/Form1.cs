using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Visy.Middleware.Pipelines.TesterApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
            Visy.Middleware.Pipelines.ExcelToXML.ExcelToXML obj = new ExcelToXML.ExcelToXML();
            obj.CustomerID = "C1018-NZ";
            label1.Text = obj.ExcelToXMLFile("D:\\interfaces\\temp\\C1018-NZ\\7a3d2780-fb94-4a8b-b874-2d10d292b6a9.xls");
            label2.Text = obj.Worksheet;
            label3.Text = obj.Parser;
        }
    }
}
