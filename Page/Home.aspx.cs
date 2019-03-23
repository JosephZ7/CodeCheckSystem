using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeCheck.Page
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
                btnToReg.Text = Session["CurrentUser"].ToString();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}