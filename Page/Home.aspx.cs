using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeCheck.Page.Algorithm;

namespace CodeCheck.Page
{
    class CodeCheckResult
    {
        public string File1;
        public string File2;
        public string Similarity;

        public CodeCheckResult(string v1, string v2, string v3)
        {
            this.File1 = v1;
            this.File2 = v2;
            this.Similarity = v3;
        }
    }

    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserName"] != null)
            {
                Label1.Text = Session["UserName"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        string ChoosedLang;

        protected void Bt_upload_Click(object sender, EventArgs e)
        {
            if (Upload_info.Text != "") Upload_info.Text = "";

            ChoosedLang = Request.Form["lang"].ToString();

            if (Request.Files.Count > 0)
            {
                int count = 0;
                HttpFileCollection UploadFiles = Request.Files;
                for (int i = 0; i < UploadFiles.Count; i++)
                {
                    HttpPostedFile PostFiles = UploadFiles[i];
                    try
                    {
                        if (PostFiles.ContentLength > 0)
                        {
                            Upload_info.Text += "文件 #" + (i + 1) + "：" + System.IO.Path.GetFileName(PostFiles.FileName);
                            string FileName = PostFiles.FileName.Substring(PostFiles.FileName.LastIndexOf('/') + 1);
                            string Extension = PostFiles.FileName.Substring(PostFiles.FileName.LastIndexOf('.') + 1);
                            
                            if (Extension.ToLower() == Request.Form["lang"].ToString())
                            {
                                PostFiles.SaveAs(Server.MapPath("../SingleFile/") + System.IO.Path.GetFileName(PostFiles.FileName));
                                count++;
                            }
                            else
                            {
                                Upload_info.Text += "发生错误，文件类型必须是选中的类型";
                            }
                            Upload_info.Text += " <br />";
                        }
                    }
                    catch (Exception Ex)
                    {
                        Upload_info.Text += "发生错误： " + Ex.Message;
                    }
                }
                Upload_info.Text += count.ToString() + "个文件上传成功";
            }
            else
            {
                Upload_info.Text = "请上传两个文件";
            }
        }

        private string GetHighlightLang(string lang)
        {
            if (lang == "Clang" || lang == "Cplusplus") return "c++";
            else if (lang == "CSharp") return "c#";
            else if (lang == "Java") return "java";
            return "c";
        }

        protected void Bt_excute_Click(object sender, EventArgs e)
        {
            System.IO.DirectoryInfo DirInfo = new System.IO.DirectoryInfo(Server.MapPath("../SingleFile/"));
            if (!DirInfo.Exists) return;

            System.IO.DirectoryInfo[] Dirs = DirInfo.GetDirectories();

            //获取对应语言文件路径集合
            
            FileInfo[] Paths = DirInfo.GetFiles("*." + Request.Form["lang"].ToString());

            List<string> files = new List<string>();
			

            //循环Paths 将每个文件信息放入List里
            foreach (FileInfo filepath in Paths)
            {
                files.Add(filepath.FullName);
            }
            if (Paths.Count() <= 1)
            {
                Response.Write("<script>alert('对应类型的文件数少于两个')</script>");
            }
            else
            {
                TOKEN GenerateToken = new TOKEN();
                Sim CalculateSimScore = new Sim();
                DFA CalculateDFAScore = new DFA();
                List<VN> MarkFile1 = new List<VN>();
                List<VN> MarkFile2 = new List<VN>();
                Winnowing Win = new Winnowing();
                WinText GenerateWinText = new WinText();
                
                CalculateDFAScore.Get_VN(files[0], MarkFile1);
                CalculateDFAScore.Get_VN(files[1], MarkFile2);

                //System.Diagnostics.Debug.WriteLine(Markfile1.Count().ToString());

                string WinText1 = GenerateWinText.FileFilter(files[0]);
                string WinText2 = GenerateWinText.FileFilter(files[1]);

                double WinScore = Win.TextSimilarity(WinText1, WinText2);
                double SimScore = CalculateSimScore.Sim_Run(GenerateToken.Read_file(files[0]), GenerateToken.Read_file(files[1]));
                double DFAScore = CalculateDFAScore.GetVarSim(MarkFile1, MarkFile2);

                double TotalScore = DFAScore * 0.3 + SimScore * 0.5 + WinScore * 0.2;

                string FileName1 = files[0].Substring(files[0].LastIndexOf('\\') + 1);
                string FileName2 = files[1].Substring(files[1].LastIndexOf('\\') + 1);

                Excute_info.Text = FileName1 + " "+ FileName2 + "  代码相似度：" + TotalScore.ToString() + "%";

                Label3.Text = FileName1;
                Label2.Text = FileName2;
                Literal1.Text = "<textarea name=\"code\" class=\"" + GetHighlightLang(Request.Form["lang"].ToString()) + "\" rows=\"15\" cols=\"100\"> "
                                + CommonFunction.GetFileContent(files[0]) + "</textarea>";
                Literal2.Text = "<textarea name=\"code\" class=\"" + GetHighlightLang(Request.Form["lang"].ToString()) + "\" rows=\"15\" cols=\"100\"> "
                                + CommonFunction.GetFileContent(files[1]) + "</textarea>";

                Upload_info.Text = "";
                for (int i = 0;i < files.Count; ++i)
                {
                    if (System.IO.File.Exists(files[i]))
                    {
                        System.IO.File.Delete(files[i]);
                    }
                }

            }
        }
    }
}