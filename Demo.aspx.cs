using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridViewFixHeader
{
    public partial class Demo : System.Web.UI.Page
    {
        public DataTable _dummmData { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            DummyData();
            gvMain.DataSource = _dummmData;
            gvMain.DataBind();
        }

        public void DummyData()
        {
            _dummmData = new DataTable();
            _dummmData.Columns.Add("A", typeof(string));
            _dummmData.Columns.Add("B", typeof(string));
            _dummmData.Columns.Add("C", typeof(string));
            _dummmData.Columns.Add("D", typeof(string));
            _dummmData.Columns.Add("E", typeof(string));
            DataRow dr_row = null;
            for(int i=0;i<100;i++)
            {
                dr_row = _dummmData.NewRow();
                dr_row.ItemArray = new object[] { $"A{i}", $"B{i}", $"C{i}", $"D{i}", $"E{i}" };
                _dummmData.Rows.Add(dr_row);
            }
        }

    }
}