using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeCheck.Page
{
    public partial class DownloadExcel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string FullFileName = Request.QueryString["id"];

            FileInfo DownloadFile = new FileInfo(HostingEnvironment.ApplicationPhysicalPath + FullFileName); // 需要转换为绝对路径，否则会自动认到C盘系统里那个IIS目录下面去，而且，无法通过URI的方式来进行数据流读取。如果你生成的文件不在web目录下，也需要明确指出。  

            // 下面到就是读取文件，通过数据流的方式下载了。

            Response.Clear();

            Response.ClearHeaders();

            Response.Buffer = false;

            Response.ContentType = "application/octet-stream";

            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FullFileName, System.Text.Encoding.UTF8));

            Response.AppendHeader("Content-Length", DownloadFile.Length.ToString());

            Response.WriteFile(DownloadFile.FullName);

            Response.Flush();

            Response.End();
        }
    }
}