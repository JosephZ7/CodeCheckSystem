using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeCheck.Page.Algorithm;
using OfficeOpenXml;

namespace CodeCheck.Page
{
    public partial class CheckFolder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LinkButton1.Visible = false;
            }
            if (Session["UserName"] != null)
            {
                Label1.Text = Session["UserName"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private bool CheckChoosenLanguage(string Extension)
        {
            if (Request.Form["Clang"] != null && Extension == Request.Form["Clang"])
                return true;
            else if (Request.Form["Cplusplus"] != null && Extension == Request.Form["Cplusplus"])
                return true;
            else if (Request.Form["Java"] != null && Extension == Request.Form["Java"])
                return true;
            else if (Request.Form["CSharp"] != null && Extension == Request.Form["CSharp"])
                return true;

            return false;
        }

        protected void Bt_upload_Click2(object sender, EventArgs e)
        {
            if (Label2.Text != "") Label2.Text = "";

            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("../Files/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);
                }
                int count = 0;
                HttpFileCollection UploadFiles = Request.Files;
                for (int i = 0; i < UploadFiles.Count; i++)
                {
                    HttpPostedFile PostFiles = UploadFiles[i];
                    try
                    {
                        if (PostFiles.ContentLength > 0)
                        {
                            Label2.Text += "文件 #" + (i + 1) + "：" + System.IO.Path.GetFileName(PostFiles.FileName) + " <br />";
                            string FileName = PostFiles.FileName.Substring(PostFiles.FileName.LastIndexOf('/') + 1);
                            string Extension = PostFiles.FileName.Substring(PostFiles.FileName.LastIndexOf('.') + 1);
                            if (CheckChoosenLanguage(Extension.ToLower()))
                            {
                                PostFiles.SaveAs(folderPath + System.IO.Path.GetFileName(PostFiles.FileName));
                                count++;
                            }
                            else
                            {
                                Label2.Text += "发生错误，文件类型必须是选中类型 <br />";
                            }
                        }
                    }
                    catch (Exception Ex)
                    {
                        Label2.Text += "发生错误： " + Ex.Message + " <br />";
                    }
                }
                Label2.Text += count.ToString() + "个文件上传成功";
            }
            else
            {
                Label2.Text = "请上传文件夹。";
            }
        }

        private void BeginProgress()
        {
            //根据ProgressBar.htm显示进度条界面
            string templateFileName = Path.Combine(Server.MapPath("."), "ProgressBar.html");
            StreamReader reader = new StreamReader(@templateFileName, System.Text.Encoding.GetEncoding("GB2312"));
            string html = reader.ReadToEnd();
            reader.Close();
            Response.Write(html);
            Response.Flush();
        }

        private void SetProgress(int percent)
        {
            string jsBlock = "<script>SetPorgressBar('" + percent.ToString() + "'); </script>";
            Response.Write(jsBlock);
            Response.Flush();
        }

        private void FinishProgress()
        {
            string jsBlock = "<script>SetCompleted();</script>";
            Response.Write(jsBlock);
            Response.Flush();
        }
        
        private string GetHighlightLang(string lang)
        {
            if (lang == "Clang" || lang == "Cplusplus") return "c++";
            else if (lang == "CSharp") return "c#";
            else if (lang == "Java") return "java";
            return "c";
        }

        private List<CodeCheckResult> ExcuteCodeCheck(List<string> Files, double MinRange, ref double MaxScore, ref int MaxIndex1, ref int MaxIndex2)
        {
            List<CodeCheckResult> OutputExcel = new List<CodeCheckResult>();
            
            TOKEN GenerateToken = new TOKEN();
            Sim CalculateSimScore = new Sim();
            DFA CalculateDFAScore = new DFA();
            Winnowing CalculateWinScore = new Winnowing();
            WinText GenerateWinText = new WinText();

            BeginProgress();

            int total = ((Files.Count() - 1) * Files.Count()) / 2;
            int Counter = 0, Bar = 0;

            List<string> WinFiles = new List<string>();
            List<List<VN>> VNFiles = new List<List<VN>>();
            List<List<string>> SimFiles = new List<List<string>>();

            for (int i = 0; i < Files.Count(); ++i)
            {
                List<VN> MF = new List<VN>();
                CalculateDFAScore.Get_VN(Files[i], MF);
                VNFiles.Add(MF);

                List<string> SF = GenerateToken.Read_file(Files[i]);
                SimFiles.Add(SF);

                WinFiles.Add(GenerateWinText.FileFilter(Files[i]));
            }

            for (int i = 0; i < Files.Count(); ++i)
            {
                for (int j = i + 1; j < Files.Count(); ++j)
                {
                    double SimScore = CalculateSimScore.Sim_Run(SimFiles[i], SimFiles[j]);
                    double DFAScore = CalculateDFAScore.GetVarSim(VNFiles[i], VNFiles[j]);
                    double WinScore = CalculateWinScore.TextSimilarity(WinFiles[i], WinFiles[j]);

                    double TotalScore = DFAScore * 0.3 + SimScore * 0.5 + WinScore * 0.2;
                    //double TotalScore = SimScore * 1.0;
                    if (TotalScore > MaxScore)
                    {
                        MaxIndex1 = i;
                        MaxIndex2 = j;
                        MaxScore = TotalScore;
                    }
                    // System.Diagnostics.Debug.WriteLine(TotalScore.ToString());

                    Bar = (Counter) * 100 / total;
                    Counter++;
                    SetProgress(Bar);
                    System.Threading.Thread.Sleep(10);

                    //System.Diagnostics.Debug.WriteLine(Bar.ToString());
                    if (TotalScore < MinRange) continue;

                    OutputExcel.Add(
                        new CodeCheckResult(Files[i].Substring(Files[i].LastIndexOf('\\') + 1)
                        , Files[j].Substring(Files[j].LastIndexOf('\\') + 1)
                        , TotalScore.ToString() + "%"));
                }
            }
            FinishProgress();
            
            return OutputExcel;
        }

        private void DeleteFiles(List<string> Files)
        {
            for (int i = 0; i < Files.Count; ++i)
            {
                if (System.IO.File.Exists(Files[i]))
                {
                    System.IO.File.Delete(Files[i]);
                }
            }
        }

        protected void Bt_excute_Click2(object sender, EventArgs e)
        {
            System.IO.DirectoryInfo DirInfo = new System.IO.DirectoryInfo(Server.MapPath("../Files/"));
            if (!DirInfo.Exists) return;

            System.IO.DirectoryInfo[] Dirs = DirInfo.GetDirectories();

            FileInfo[] CPaths, CppPaths, JavaPaths, CsharpPaths;

            List<string> CFiles = new List<string>();
            List<string> CppFiles = new List<string>();
            List<string> JavaFiles = new List<string>();
            List<string> CsharpFiles = new List<string>();

            //获取对应类型文件路径集合
            if (Request.Form["Clang"] != null)
            {
                CPaths = DirInfo.GetFiles("*.c", SearchOption.AllDirectories);
                foreach (FileInfo FilePath in CPaths)
                {
                    CFiles.Add(FilePath.FullName);
                }
            }
            if (Request.Form["Cplusplus"] != null)
            {
                CppPaths = DirInfo.GetFiles("*.cpp", SearchOption.AllDirectories);
                foreach (FileInfo FilePath in CppPaths)
                {
                    CppFiles.Add(FilePath.FullName);
                }
            }
            if (Request.Form["Java"] != null)
            {
                JavaPaths = DirInfo.GetFiles("*.java", SearchOption.AllDirectories);
                foreach (FileInfo FilePath in JavaPaths)
                {
                    JavaFiles.Add(FilePath.FullName);
                }
            }
            if (Request.Form["CSharp"] != null)
            {
                CsharpPaths = DirInfo.GetFiles("*.cs", SearchOption.AllDirectories);
                foreach (FileInfo FilePath in CsharpPaths)
                {
                    CsharpFiles.Add(FilePath.FullName);
                }
            }
            
            if(!(Request.Form["Clang"] != null || Request.Form["Cplusplus"] != null || Request.Form["Java"] != null || Request.Form["CSharp"] != null))
            {
                Response.Write("<script>alert('请上传文件并选择查重编程语言')</script>");
                return;
            }

            double MinRange = 0;
            if (RangeText.Text != "")
            {
                if (Convert.ToDouble(RangeText.Text) >= 0 && Convert.ToDouble(RangeText.Text) <= 100)
                {
                    MinRange = Convert.ToDouble(RangeText.Text);
                }
                else
                {
                    Response.Write("<script>alert('输入的过滤区间值不正确！')</script>");
                    return;
                }
            }

            double MaxScore = 0;
            int MaxIndex1 = -1, MaxIndex2 = -1;
            double TmpScore = 0;
            int lang = 0;

            if (CFiles.Count() > 1)
            {
                List<CodeCheckResult> OutputExcelForC = ExcuteCodeCheck(CFiles, MinRange,ref MaxScore,ref MaxIndex1,ref MaxIndex2);
                if (MaxScore > TmpScore)
                {
                    TmpScore = MaxScore;
                    lang = 1;
                }

                DataTable CData = new DataTable();
                CData.Columns.Add("FileName1");
                CData.Columns.Add("FileName2");
                CData.Columns.Add("Similarity");
                for (int i = 0; i < OutputExcelForC.Count(); ++i)
                {
                    CData.Rows.Add(OutputExcelForC[i].File1, OutputExcelForC[i].File2, OutputExcelForC[i].Similarity);
                }

                GridView1.DataSource = CData;
                GridView1.DataBind();
                ViewState["CData"] = CData;
            }

            if (CppFiles.Count() > 1)
            {
                List<CodeCheckResult> OutputExcelForCpp = ExcuteCodeCheck(CppFiles, MinRange,ref MaxScore,ref MaxIndex1,ref MaxIndex2);
                if (MaxScore > TmpScore)
                {
                    TmpScore = MaxScore;
                    lang = 2;
                }

                DataTable CppData = new DataTable();
                CppData.Columns.Add("FileName1");
                CppData.Columns.Add("FileName2");
                CppData.Columns.Add("Similarity");
                for (int i = 0; i < OutputExcelForCpp.Count(); ++i)
                {
                    CppData.Rows.Add(OutputExcelForCpp[i].File1, OutputExcelForCpp[i].File2, OutputExcelForCpp[i].Similarity);
                }

                GridView2.DataSource = CppData;
                GridView2.DataBind();
                ViewState["CppData"] = CppData;
            }

            if (JavaFiles.Count() > 1)
            {
                List<CodeCheckResult> OutputExcelForJava = ExcuteCodeCheck(JavaFiles, MinRange,ref MaxScore,ref MaxIndex1,ref MaxIndex2);
                if (MaxScore > TmpScore)
                {
                    TmpScore = MaxScore;
                    lang = 3;
                }

                DataTable JavaData = new DataTable();
                JavaData.Columns.Add("FileName1");
                JavaData.Columns.Add("FileName2");
                JavaData.Columns.Add("Similarity");
                for (int i = 0; i < OutputExcelForJava.Count(); ++i)
                {
                    JavaData.Rows.Add(OutputExcelForJava[i].File1, OutputExcelForJava[i].File2, OutputExcelForJava[i].Similarity);
                }

                GridView3.DataSource = JavaData;
                GridView3.DataBind();
                ViewState["JavaData"] = JavaData;
            }

            if (CsharpFiles.Count() > 1)
            {
                List<CodeCheckResult> OutputExcelForCsharp = ExcuteCodeCheck(CsharpFiles, MinRange,ref MaxScore,ref MaxIndex1,ref MaxIndex2);
                if (MaxScore > TmpScore)
                {
                    TmpScore = MaxScore;
                    lang = 4;
                }

                DataTable CsharpData = new DataTable();
                CsharpData.Columns.Add("FileName1");
                CsharpData.Columns.Add("FileName2");
                CsharpData.Columns.Add("Similarity");
                for (int i = 0; i < OutputExcelForCsharp.Count(); ++i)
                {
                    CsharpData.Rows.Add(OutputExcelForCsharp[i].File1, OutputExcelForCsharp[i].File2, OutputExcelForCsharp[i].Similarity);
                }

                GridView4.DataSource = CsharpData;
                GridView4.DataBind();
                ViewState["CsharpData"] = CsharpData;
            }

            string MaxFile1, MaxFile2;
            string HighlightLang;

            if (lang == 1)
            {
                MaxFile1 = String.Copy(CFiles[MaxIndex1]);
                MaxFile2 = String.Copy(CFiles[MaxIndex2]);
                HighlightLang = Request.Form["C"].ToString();
            }
            else if (lang == 2)
            {
                MaxFile1 = String.Copy(CppFiles[MaxIndex1]);
                MaxFile2 = String.Copy(CppFiles[MaxIndex2]);
                HighlightLang = Request.Form["Cplusplus"].ToString();
            }
            else if (lang == 3)
            {
                MaxFile1 = String.Copy(JavaFiles[MaxIndex1]);
                MaxFile2 = String.Copy(JavaFiles[MaxIndex2]);
                HighlightLang = Request.Form["Java"].ToString();
            }
            else if(lang == 4)
            {
                MaxFile1 = String.Copy(CsharpFiles[MaxIndex1]);
                MaxFile2 = String.Copy(CsharpFiles[MaxIndex2]);
                HighlightLang = Request.Form["CSharp"].ToString();
            }
            else
            {
                Response.Write("<script>alert('请上传文件并选择查重编程语言')</script>");
                return;
            }

            Label3.Text = MaxFile1.Substring(MaxFile1.LastIndexOf('\\') + 1);
            Label4.Text = MaxFile2.Substring(MaxFile2.LastIndexOf('\\') + 1);
            Label5.Text = "最高相似度为：" + MaxScore.ToString();
            Literal1.Text = "<textarea name=\"code\" class=\"" + GetHighlightLang(HighlightLang) + "\" rows=\"15\" cols=\"100\"> "
                            + CommonFunction.GetFileContent(MaxFile1) + "</textarea>";
            Literal2.Text = "<textarea name=\"code\" class=\"" + GetHighlightLang(HighlightLang) + "\" rows=\"15\" cols=\"100\"> "
                            + CommonFunction.GetFileContent(MaxFile2) + "</textarea>";
            
            LinkButton1.Visible = true;
            Label2.Text = "";

            DeleteFiles(CFiles);
            DeleteFiles(CppFiles);
            DeleteFiles(JavaFiles);
            DeleteFiles(CsharpFiles);
        }
        
        private static DataTable GridViewToDataTable(GridView gv)
        {
            DataTable dt = new DataTable();
            DataColumn dc;//创建列 
            DataRow dr;       //创建行 
                              //构造列 
            for (int i = 0; i < gv.Columns.Count; i++)
            {
                dc = new DataColumn();
                dc.ColumnName = gv.Columns[i].HeaderText;
                dt.Columns.Add(dc);
            }
            //构造行 
            for (int i = 0; i < gv.Rows.Count; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < gv.Columns.Count; j++)
                {
                    dr[j] = gv.Rows[i].Cells[j].Text;
                }
                dt.Rows.Add(dr);
            }

            return dt;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            //Response.AddHeader("content-disposition", "attachment;filename=CodeCheckResult.xls");
            //Response.Charset = "";
            //Response.ContentType = "application/vnd.ms-excel";

            using (ExcelPackage pck = new ExcelPackage())
            {
                //Create the worksheet 
                if(GridView1.Rows.Count > 0)
                {
                    ExcelWorksheet wsC = pck.Workbook.Worksheets.Add("C");
                    DataTable dt = ViewState["CData"] as DataTable;
                    wsC.Cells["A1"].LoadFromDataTable(dt, true);
                }

                if (GridView2.Rows.Count > 0)
                {
                    ExcelWorksheet wsCpp = pck.Workbook.Worksheets.Add("C++");
                    DataTable dt = ViewState["CppData"] as DataTable;
                    wsCpp.Cells["A1"].LoadFromDataTable(dt, true);
                }

                if (GridView3.Rows.Count > 0)
                {
                    ExcelWorksheet wsJava = pck.Workbook.Worksheets.Add("Java");
                    DataTable dt = ViewState["JavaData"] as DataTable;
                    wsJava.Cells["A1"].LoadFromDataTable(dt, true);
                }

                if (GridView4.Rows.Count > 0)
                {
                    ExcelWorksheet wsCSharp = pck.Workbook.Worksheets.Add("C#");
                    DataTable dt = ViewState["CsharpData"] as DataTable;
                    wsCSharp.Cells["A1"].LoadFromDataTable(dt, true);
                }

                //Write it back to the client 
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=CodeCheckResult.xlsx");
                Response.BinaryWrite(pck.GetAsByteArray());
            }
            //using (StringWriter sw = new StringWriter())
            //{
            //    HtmlTextWriter hw = new HtmlTextWriter(sw);

            //    //To Export all pages
            //    if (GridView1.DataSource != null)
            //    {
            //        GridView1.AllowPaging = false;

            //        GridView1.HeaderRow.BackColor = Color.White;
            //        foreach (TableCell cell in GridView1.HeaderRow.Cells)
            //        {
            //            cell.BackColor = GridView1.HeaderStyle.BackColor;
            //        }
            //        foreach (GridViewRow row in GridView1.Rows)
            //        {
            //            row.BackColor = Color.White;
            //            foreach (TableCell cell in row.Cells)
            //            {
            //                if (row.RowIndex % 2 == 0)
            //                {
            //                    cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
            //                }
            //                else
            //                {
            //                    cell.BackColor = GridView1.RowStyle.BackColor;
            //                }
            //                cell.CssClass = "textmode";
            //            }
            //        }

            //        GridView1.RenderControl(hw);
            //    }
                //style to format numbers to string
               // string style = @"<style> .textmode { } </style>";
               // Response.Write(style);
               // Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            
        }

        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //    //base.VerifyRenderingInServerForm(control);
        //}
    }
}