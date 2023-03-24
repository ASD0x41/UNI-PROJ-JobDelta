using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Namespace for Data Access:
using JobDelta.Data_Access_Layer;

namespace JobDelta
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGrid();
        }

        // Test Function:
        public void LoadGrid()
        {
            DAL objMyDal = new DAL();
            ItemGrid.DataSource = objMyDal.TestFunction();
            ItemGrid.DataBind();
        }
    }
}