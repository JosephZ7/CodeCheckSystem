using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeCheck.Page
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string UserName = Request.QueryString["UserName"];
            string Email = Request.QueryString["Email"];
            string Password = Context.Request["Password"];

            string str = "server=(local)\\SQLSERVER;database=CodeCheck;uid=DESKTOP-4GRJ6EF;pwd=;Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            string sql = "select * from CodeCheck where UserName='" + UserName + "'";
            SqlCommand comm = new SqlCommand(sql, conn);
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                sdr.Close();
                string InsertSql = "UPDATE CodeCheck Set Password='"+Password+"' Where UserName='" + UserName + "' and Email='"+Email+"'";
                SqlCommand InsertCmd = new SqlCommand(InsertSql, conn);
                try
                {
                    InsertCmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                Response.Write("<script>alert('修改密码成功');location.href='Login.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('用户名重复');</script>");
            }
            conn.Close();
        }
    }
}