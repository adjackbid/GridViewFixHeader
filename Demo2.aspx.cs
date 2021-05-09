using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridViewFixHeader
{
    public partial class Demo2 : System.Web.UI.Page
    {
        public DataTable _dummmData { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            DummyData();
            gvContent.DataSource = _dummmData;
            gvContent.DataBind();
            gvContent.HeaderRow.Visible = false;

            var dtTemp = _dummmData.Clone();
            var dr = dtTemp.NewRow();
            dtTemp.Rows.Add(dr);
            gvHeader.DataSource = dtTemp;
            gvHeader.DataBind();
            gvHeader.Rows[0].Visible = false;
        }

        public void DummyData()
        {
            string[] Cols = new string[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S" };
            //string[] Cols = new string[] { "A", "B", "C" };
            _dummmData = new DataTable();
            foreach (string col in Cols)
            {
                _dummmData.Columns.Add(col, typeof(string));
            }
            DataRow dr_row = null;

            dr_row = _dummmData.NewRow();
            dr_row["A"] = "123djfjkdlsfjkldsfjldsfdsfsdfsdfsdfsdfsd";
            _dummmData.Rows.Add(dr_row);
            for (int i = 0; i < 100; i++)
            {
                dr_row = _dummmData.NewRow();
                foreach (string col in Cols)
                {
                    dr_row[col] = $"{col}{i}";
                }
                _dummmData.Rows.Add(dr_row);
            }
        }

        private Unit[] cellWidth;

        protected void gvContent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    cellWidth = new Unit[e.Row.Cells.Count];
            //    for (int i = 0; i < e.Row.Cells.Count; i++)
            //    {
            //        //cellWidth[i] = e.Row.Cells[i].Width;
            //    }
            //}
        }

        protected void gvHeader_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    for (int i = 0; i < e.Row.Cells.Count; i++)
            //    {
            //        e.Row.Cells[i].Width = cellWidth[i];
            //    }
            //}
        }
    }
}