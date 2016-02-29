using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Linq;
using Microsoft.Data.Schema.ScriptDom.Sql;
using System.IO;
using Microsoft.Data.Schema.ScriptDom;
using System.Configuration;
using System.Data.SqlClient;
using System.Xml;
using System.Collections;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog fDialog = new OpenFileDialog();

// To set the title of window
fDialog.Title = "Open Image Files";

// To apply filter, which only allows the files with the name or extension specified to be selected. in this example i m only using jpeg and GIF files
fDialog.Filter = "SQL Files|*.sql|trace Files|*.trc";

// To set the Initial Directory property ,means which directory to show when the open file dialog windows opens
fDialog.InitialDirectory = @"C:\";

 //if the user has clicked the OK button after choosing a file,To display a MessageBox with the path of the file:
if(fDialog.ShowDialog() == DialogResult.OK)
{
    textBox3.Text = fDialog.FileName.ToString();
//MessageBox.Show(fDialog.FileName.ToString());
}

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "")
            {
                MessageBox.Show("Please enter server and db");
                return;
            }
            label3.Visible = true;
            label3.Text = " Status: Executing Query...";
            string filePath = textBox3.Text;
            string Script = string.Empty;
            using (StreamReader streamReader = new StreamReader(filePath)) { Script = streamReader.ReadToEnd(); }
            IList<string> errors;

            SqlConnection conn = new SqlConnection();
            SqlConnection conn2 = new SqlConnection();
            string querystring = "";
            ConnectionStringSettings settings =
   ConfigurationManager.ConnectionStrings["MyConnection"];
            ConnectionStringSettings settingsDynamic = new ConnectionStringSettings();
            settingsDynamic.ProviderName = "System.Data.SqlClient";
            settingsDynamic.ConnectionString = "Persist Security Info=False;Integrated Security=SSPI;database=" + textBox2.Text +
                  ";server=" + textBox1.Text + ";";

            conn.ConnectionString = settingsDynamic.ToString();
            conn2.ConnectionString = settingsDynamic.ToString();
            conn.Open();

            querystring = "set showplan_xml on ";
                //+ System.Environment.NewLine + " go  " +System.Environment.NewLine + Script;
            SqlCommand cmd = new SqlCommand(querystring, conn);
            cmd.ExecuteNonQuery();
            querystring = Script;
            SqlCommand cmd2 = new SqlCommand(querystring, conn);
            cmd.CommandTimeout = 21600;
            cmd2.CommandTimeout = 21600;
            SqlCommand cmd3;
            SqlDataReader rdr;
            try
            {
                
                rdr = cmd2.ExecuteReader();
                rdr.Read();
            }
            catch (Exception ex)
            {
                querystring = "set showplan_xml off ";
                cmd = new SqlCommand(querystring, conn);
                cmd.ExecuteNonQuery();
                querystring = Script;
                cmd = new SqlCommand(querystring, conn);
                cmd.CommandTimeout = 21600;
                cmd.ExecuteNonQuery();
                querystring = "set showplan_xml on ";
                cmd = new SqlCommand(querystring, conn);
                cmd.ExecuteNonQuery();
                querystring = Script;
                cmd2 = new SqlCommand(querystring, conn);
                rdr = cmd2.ExecuteReader();
                rdr.Read();


            }
   
            //XmlDocument xml = (XmlDocument)rdr[0];
            label3.Text = " Status: Parsing Output...";
            String xmldoc = (string)rdr[0];

            rdr.Close();
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(xmldoc);
            System.IO.File.WriteAllText("serializeout", xmldoc);
            conn2.Open();
            xmldoc = xmldoc.Replace("\"", "");
            querystring = "set quoted_identifier off insert into queryxml select \"" + xmldoc.Replace("'", "\'") + "\""+
                ", " + "\"" + querystring.Replace("'","\'") + "\"" +", getdate()";
            cmd3 = new SqlCommand(querystring, conn2);


            cmd3.CommandText = "parsexml3";
            cmd3.ExecuteNonQuery();
            label3.Text = " Status: Done...";
        
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}
