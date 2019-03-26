using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeCheck.Page
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void CodeCheckLogin()
        {
            string UserName = TextBox1.Text;
            string Password = TextBox2.Text;

            string str = "server=(local)\\SQLSERVER;database=CodeCheck;uid=DESKTOP-4GRJ6EF;pwd=;Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            string sql = "select * from CodeCheck where UserName='" + UserName + "' and Password='" + Password + "'";
            SqlCommand comm = new SqlCommand(sql, conn);
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                Session["UserName"] = TextBox1.Text;
                Session["Password"] = TextBox2.Text;
                Response.Write("<script>alert('欢迎" + Session["UserName"] + ",您成功登录!');location.href='Home.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('无法登陆，用户名或密码错误！');</script>");
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CodeCheckLogin();
        }
    }
}