using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeCheck.Page
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CodeCheckRegister()
        {
            string Email = TextBox3.Text;
            string UserName = TextBox1.Text;
            string Password = TextBox2.Text;

            string str = "server=(local)\\SQLSERVER;database=CodeCheck;uid=DESKTOP-4GRJ6EF;pwd=;Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            string sql = "select * from CodeCheck where UserName='" + UserName + "'";
            SqlCommand comm = new SqlCommand(sql, conn);
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                Response.Write("<script>alert('用户名重复');</script>");
            }
            else
            {
                sdr.Close();
                string EmailSql = "select * from CodeCheck where Email='" + Email + "'";
                SqlCommand commEmail = new SqlCommand(sql, conn);
                SqlDataReader sdrEmail = comm.ExecuteReader();
                if (sdrEmail.Read())
                {
                    sdrEmail.Close();
                    Response.Write("<script>alert('邮件已被注册');location.href='Register.aspx';</script>");
                    return;
                }
                sdrEmail.Close();

                string InsertSql = "INSERT INTO CodeCheck(UserName, Password, Email) VALUES('" + UserName + "','" + Password + "','" + Email + "')";
                SqlCommand InsertCmd = new SqlCommand(InsertSql, conn);
                try
                {
                    InsertCmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                Response.Write("<script>alert('注册成功');location.href='Login.aspx';</script>");
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CodeCheckRegister();
        }
    }
}