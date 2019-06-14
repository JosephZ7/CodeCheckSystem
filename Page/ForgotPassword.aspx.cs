using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Text;
using System.Net;

namespace CodeCheck.Page
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ToEmail = Context.Request["Email"];

            string str = "server=(local)\\SQLSERVER;database=CodeCheck;uid=DESKTOP-4GRJ6EF;pwd=;Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            string sql = "select * from CodeCheck where Email='" + ToEmail + "'";
            SqlCommand comm = new SqlCommand(sql, conn);
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                string UserName = sdr["UserName"].ToString();
                bool IsSend = SendMail(ToEmail, UserName);
                Response.Write("<script>alert('成功发送邮件，请查收！');</script>");

            }
            else
            {
                Response.Write("<script>alert('无法登陆，邮箱尚未注册！');</script>");
            }
            conn.Close();
        }

        public bool SendMail(string ToEmail, string UserName)
        {
            string Email = "Joseph_Z7@163.com";
            string password = "zl78951237";
            Encoding EnCode = Encoding.UTF8;
            System.Net.Mail.MailMessage Message = new System.Net.Mail.MailMessage();
            Message.From = new MailAddress(Email, "在线代码查重系统", EnCode);
            Message.To.Add(new MailAddress(ToEmail, "尊敬的用户", EnCode));
            Message.Subject = "在线代码查重系统找回密码";
            Message.SubjectEncoding = EnCode;

            StringBuilder MailContent = new StringBuilder();
            MailContent.Append("尊敬的用户：<br/>");
            MailContent.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好！你于");
            MailContent.Append(DateTime.Now.ToLongTimeString());
            MailContent.Append("通过<a href='#'>在线查重</a>管理系统申请找回密码。");
            MailContent.Append("<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为了安全起见，请用户点击以下链接重设个人密码：");
            string url = "http://localhost:82/Page/ResetPassword.aspx?UserName=" + UserName + "&Email=" + ToEmail;
            MailContent.Append("<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + url + "'>" + url + "</a>");
            Message.Body = MailContent.ToString();
            Message.BodyEncoding = EnCode;
            Message.IsBodyHtml = true;

            try
            {
                SmtpClient smtp = new SmtpClient("smtp.163.com", 25);
                smtp.Credentials = new NetworkCredential(Email, password);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(Message);
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                Message.Dispose();
            }
            return true;
        }
    }
}