using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeCheck.Page
{
    class Result
    {
        public string file1 = "", file2 = "";
        public double p1 = 0.0f, p2 = 0.0f, p3 = 0.0f, total = 0.0f;
        public static bool operator <(Result a, Result b)
        {
            return a.p1 > b.p1;
        }
        public static bool operator >(Result a, Result b)
        {
            return a.p1 < b.p1;
        }
    };

    class VN
    {
        public int[] items = new int[7];
        public int type, layer;
        public string name;
    };

    class DFA
    {
        public const int MAX_STR = 2560;
        public const int MAX_KEYWORDS = 16;
        public const int MAX_OPERATORS = 12;
        public const int MAX_SEPARATORS = 15;
        public const int STA_START = 1;
        public const int STA_IDorKEYWORD = 2; /*   IDENTIFIER： 标识符   */
        public const int STA_NUMBER = 3;      /*   NUMBER：     数字     */
        public const int STA_NOTE = 4;        /*   NOTE:        注释     */
        public const int STA_CONSTANT = 5;    /*   CONSTANT:    常量     */
        public const int STA_DONE = 6;       /*   DONE：       完成     */
        public const int TYPE_KEYWORD = 1;    /*   KEYWORD：    保留字   */
        public const int TYPE_IDENTIFIER = 2; /*   IDENTIFIER： 标识符   */
        public const int TYPE_NUMBER = 3;     /*   NUMBER：     数字     */
        public const int TYPE_NOTE = 4;       /*   NOTE:        注释     */
        public const int TYPE_CONSTANT = 5;   /*   CONSTANT:    常量     */
        public const int TYPE_OPERATOR = 6;   /*   OPERATOR:    运算符   */
        public const int TYPE_SEPARATOR = 7;  /*   SEPARATOR:   分隔符   */
        public const int TYPE_ERROR = 8;      /*   ERROR:       错误     */
        public const int TYPE_UNKNOWN = 9;    /*   UNKNOWN:     未知     */
        public const int TYPE_ENDFILE = 10;   /*   ENDFILE:     文件结束 */

        public string[] Operators = { "+", "-", "*", "/", "%", "=", "==", "!=", "<", "<=", ">", ">=" };
        public string[] Separators = { ",", ";", ".", "\'", "\"", "(", ")", "[", "]", "{", "}", "//", "/*", "*/", "#" };
        public string[] Keywords = { "if", "do", "while", "for", "double", "float", "bool", "char", "int", "long", "vector", "map", "stack", "queue", "pair", "string" };

        public Dictionary<string, int> ma = new Dictionary<string, int>();
        public string Keyword;
        public string Separator;
        public string Identifier;
        public string Operator;
        public int Layer;
        public bool[] mark;

        public int IsOperator(char c)
        {
            for (int i = 0; i < MAX_OPERATORS; i++)
                if (Operators[i][0] == c)
                    return 1;
            return 0;
        }

        public int IsSeparator(char c)
        {
            for (int i = 0; i < MAX_SEPARATORS; i++)
                if (Separators[i][0] == c)
                    return 1;
            return 0;
        }

        public int IsKeyword(string str)
        {
            for (int i = 0; i < MAX_KEYWORDS; i++)
            {
                if (String.Compare(str, Keywords[i], false) == 0)
                {
                    return 1;
                }
            }
            return 0;
        }

        public void Init_last()
        {
            Keyword = "";
            Separator = "";
            Identifier = "";
            Operator = "";
        }

        public void OutputOneDone(int type, string str, List<VN> va)
        {
            VN tvn = new VN();

            if (IsKeyword(str) != 0)
            {
                Init_last();
                Keyword = str;
                return;
            }

            switch (type)
            {

                case TYPE_IDENTIFIER:
                    {
                        Identifier = str;
                        if (Keyword != "")
                        {
                            int pos = 0;
                            for (int i = 0; i < MAX_KEYWORDS; i++)
                                if (String.Compare(Keyword, Keywords[i], false) == 0)
                                {
                                    pos = i;
                                    break;
                                }
                            tvn.name = str;
                            tvn.layer = Layer;

                            if (pos > 3)
                            {
                                if (ma.ContainsKey(Identifier) == false)
                                {
                                    ma.Add(Identifier, va.Count());
                                }
                                else
                                {
                                    ma[Identifier] = va.Count();
                                }
                                tvn.type = pos;
                                va.Add(tvn);
                            }
                            else
                            {
                                if (ma.ContainsKey(Identifier) == false)
                                {
                                    ma.Add(Identifier, 0);
                                }
                                va[ma[Identifier]].items[pos]++;
                            }
                        }
                        else
                        {

                            tvn.name = str;
                            tvn.layer = Layer;
                            if (ma.ContainsKey(Identifier) == false)
                                break;
                            if (Operator == "++")
                                va[ma[Identifier]].items[4]++;
                            else if (Operator == "--")
                                va[ma[Identifier]].items[5]++;
                        }
                    }
                    break;

                case TYPE_OPERATOR:
                    {
                        if (Operator == "+" || Operator == "-")
                        {
                            if (Identifier != "")
                            {
                                tvn.name = Identifier;
                                tvn.layer = Layer;
                                if (ma.ContainsKey(Identifier) == true)
                                    return;
                                else
                                    ma.Add(Identifier, 0);
                                if (va.Count == 0)
                                    va.Add(new VN());
                                if (str[0] == '+')
                                    va[ma[Identifier]].items[4]++;
                                else
                                    va[ma[Identifier]].items[5]++;
                                Identifier = "";
                                Operator = "";
                            }
                            else
                                Operator += str[0];
                        }
                        else
                        {
                            if (str[0] == '=' && Operator == "")
                            {
                                if (ma.ContainsKey(Identifier) == false)
                                {
                                    ma.Add(Identifier, 0);
                                }
                                va[ma[Identifier]].items[6]++;
                                Operator = "";
                            }
                            else
                                Operator = str;
                        }
                    }
                    break;

                case TYPE_SEPARATOR:
                    {
                        tvn.layer = Layer;
                        tvn.name = Identifier;
                        Separator = str;
                        if (Separator == ";")
                            Init_last();
                        else if (Separator == "(")
                            Operator = "";
                        else if (Separator != ",")
                        {
                            Keyword = "";
                            Operator = "";
                        }
                        break;
                    }
                default:
                    break;
            }
        }

        public void LexAnalyse(StreamReader inf, List<VN> va)
        {
            char c;
            char[] str = new char[MAX_STR];/* 过程字符串 */
            int i;
            string result = inf.ReadToEnd();
            int j = 0;
            int state, type = 0;
            int flag_limit_one_line;// 注释
            int flag_had_got_dot;
            while (j < result.Length)
            {
                i = 0;
                state = STA_START;
                flag_limit_one_line = 0;
                flag_had_got_dot = 0;
                while (state != STA_DONE)
                {
                    if (j >= result.Length) break;
                    c = result[j++];
                    switch (state)
                    {
                        case STA_START:
                            if (c == ' ' || c == '\t') ;
                            else if (c == '\n') ;
                            else if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_')
                            {
                                state = STA_IDorKEYWORD;
                                type = TYPE_IDENTIFIER;
                                str[i++] = c;
                            }
                            else if (c >= '0' && c <= '9')
                            {
                                state = STA_NUMBER;
                                type = TYPE_NUMBER;
                                str[i++] = c;
                            }
                            else if (c == '/')
                            {
                                str[i++] = c;
                                c = result[j++];
                                if (c == '/')   /*   //注释    */
                                {
                                    flag_limit_one_line = 1;
                                    state = STA_NOTE;
                                    type = TYPE_NOTE;
                                    str[i++] = c;
                                }
                                else if (c == '*')       /*   / * 注释开始    */
                                {
                                    state = STA_NOTE;
                                    type = TYPE_NOTE;
                                    str[i++] = c;
                                }
                                else
                                {
                                    state = STA_DONE;
                                    type = TYPE_OPERATOR;
                                    j--;
                                    i = 1;/* str[1]='\0'; */
                                }
                            }
                            else if (c == '<' || c == '>')
                            {
                                state = STA_DONE;
                                type = TYPE_OPERATOR;
                                str[0] = c;
                                c = result[j++];
                                if (c == '=')
                                {
                                    str[1] = '=';
                                    i = 2;/* str[2]='\0'    */
                                }
                                else
                                {
                                    j--;
                                    i = 1;/* str[1]='\0'; */
                                }
                            }
                            else if (c == '!')
                            {
                                state = STA_DONE;
                                str[0] = c;
                                c = result[j++];
                                if (c == '=')  /*    是!= */
                                {
                                    type = TYPE_OPERATOR;
                                    str[1] = '=';
                                    i = 2;/* str[2]='\0'    */
                                }
                                else        /*    非!= */
                                {
                                    type = TYPE_UNKNOWN;
                                    j--;
                                    i = 1;/* str[1]='\0'; */
                                }
                            }
                            else if (c == '\"' || c == '\'')
                            {
                                state = STA_CONSTANT;
                                type = TYPE_CONSTANT;
                                str[0] = c;
                                i = 1;
                            }
                            else if (IsOperator(c) != 0)
                            {
                                state = STA_DONE;
                                type = TYPE_OPERATOR;
                                str[0] = c;
                                i = 1;/* str[1]='\0'; */
                            }
                            else if (IsSeparator(c) != 0)
                            {
                                if (c == '(' || c == '{')
                                    Layer++;
                                else if (c == ')' || c == '}')
                                    Layer--;
                                state = STA_DONE;
                                type = TYPE_SEPARATOR;
                                str[0] = c;
                                i = 1;/* str[1]='\0'; */
                            }
                            else if (j >= result.Length)
                            {
                                state = STA_DONE;
                                type = TYPE_ENDFILE;
                            }
                            else
                            {
                                state = STA_DONE;
                                type = TYPE_UNKNOWN;
                            }
                            break;/* case STA */
                        case STA_IDorKEYWORD:
                            if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '_')
                                str[i++] = c;
                            else if (c == '.')
                            {
                                str[i++] = c;
                                c = result[j++];
                                if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_')
                                    str[i++] = c;
                                else if (c == ' ' || c == '\t' || c == '\n' || IsOperator(c) != 0 || IsSeparator(c) != 0)
                                {
                                    j--;
                                    state = STA_DONE;
                                    type = TYPE_ERROR;         /*  如 date. 或 date.1 标记为ERROR类型 */
                                }
                                else
                                {
                                    str[i++] = c;
                                    type = TYPE_ERROR;
                                }
                            }
                            else if (c == ' ' || c == '\t' || c == '\n' || IsOperator(c) != 0 || IsSeparator(c) != 0)
                            {
                                state = STA_DONE;
                                j--;
                            }
                            else
                            {
                                state = STA_DONE;
                                type = TYPE_ERROR;
                            }
                            break;/* case STA */
                        case STA_NUMBER:
                            if (c >= '0' && c <= '9')
                                str[i++] = c;
                            else if (c == '.')   /* 小数识别  */
                            {
                                str[i++] = c;
                                c = result[j++];
                                if (flag_had_got_dot == 0)
                                {
                                    if (c >= '0' && c <= '9')
                                    {
                                        str[i++] = c;
                                        flag_had_got_dot = 1;
                                    }
                                    else /* if(c==' ' || c=='\t' || c=='\n' || c>='0' && c<='9' || ...) */
                                    {
                                        j--;
                                        state = STA_DONE;
                                        type = TYPE_ERROR;         /*  如 date. 或 date.1 标记为ERROR类型 */
                                    }
                                }
                                else
                                {
                                    type = TYPE_ERROR;
                                    str[i++] = c;
                                }
                            }
                            else if (c == ' ' || c == '\t' || c == '\n' || IsOperator(c) != 0 || IsSeparator(c) != 0)
                            {
                                state = STA_DONE;
                                j--;
                            }
                            else
                            {
                                str[i++] = c;
                                type = TYPE_ERROR;
                            }
                            break;/* case STA */
                        case STA_NOTE:
                            if (flag_limit_one_line == 1)   /*      是/ * 注释, 限定一行 */
                            {
                                if (c == '\n')
                                {
                                    state = STA_DONE;
                                    j--;
                                }
                                else
                                    str[i++] = c;
                            }
                            else /*      是  / *   注释 */
                            {
                                if (j >= result.Length)
                                {
                                    state = STA_DONE;
                                    type = TYPE_ERROR;
                                }
                                else if (c == '\n')
                                    str[i++] = c;
                                else if (c == '*')
                                {
                                    str[i++] = c;
                                    c = result[j++];
                                    if (c == '/')
                                    {
                                        state = STA_DONE;
                                        str[i++] = c;
                                    }
                                    else
                                    {
                                        if (j >= result.Length)
                                        {
                                            state = STA_DONE;
                                            type = TYPE_ERROR;
                                        }
                                        j--;
                                    }
                                }
                                else
                                    str[i++] = c;
                            }
                            break;/* case STA */
                        case STA_CONSTANT:
                            if (j >= result.Length)
                            {
                                state = STA_DONE;
                                type = TYPE_ERROR;
                            }
                            else if (c == '\n')
                                str[i++] = c;
                            else if (c == '\"' || c == '\'')
                            {
                                state = STA_DONE;
                                str[i++] = c;
                            }
                            else if (c == '\\')
                            {
                                str[i++] = c;
                                c = result[j++];
                                str[i++] = c;
                            }
                            else
                                str[i++] = c;
                            break;/* case STA */
                        case STA_DONE:
                            break;/* case STA */
                        default:
                            break;/* case STA */
                    }
                }/* state=STA_DONE */
                str[i] = '\0';

                StringBuilder sb = new StringBuilder();
                for (int g = 0; g < i; g++)
                {
                    sb.Append(str[g]);
                }
                string tmpstr = sb.ToString();
                OutputOneDone(type, tmpstr, va);
            }/* feof(inf) */
        }

        public void Get_VN(string path, List<VN> va)
        {
            Init_last();
            va.Clear();
            Layer = 1;
            StreamReader input = new StreamReader(path);
            LexAnalyse(input, va);
            input.Close();
        }

        public bool Is_cpp(string path)
        {
            for (int i = path.Length - 1; i >= 0; i--)
            {
                if (path[i] == '.')
                {
                    string tmp = path.Substring(i + 1, 3);
                    String f = "";
                    for (int j = 0; j < tmp.Length; j++)
                        if (tmp[j] >= 'A' && tmp[j] <= 'Z')
                            f += tmp[j];
                    return f == "cpp" || f == "c";
                }
            }
            return false;
        }

        public List<string> Get_files_name(string path)
        {
            List<string> files = new List<string>();
            DirectoryInfo dir = new DirectoryInfo(path);
            FileInfo[] fil = dir.GetFiles();
            foreach (FileInfo file in fil)
            {
                if (Is_cpp(file.FullName))
                    files.Insert(files.Count() - 1, file.FullName);
            }

            return files;
        }

        public double Get_varsim(List<VN> a, List<VN> b)
        {
            int samecnt = 0;
            mark = new bool[100000];
            for (int i = 0; i < a.Count(); i++)
            {
                for (int j = 0; j < b.Count(); j++)
                {
                    if (a[i].type == b[j].type && a[i].layer == b[j].layer && mark[j] == false)
                    {
                        int cnt = 0;
                        for (int k = 0; k < 7; k++)
                        {
                            if (a[i].items[k] != b[j].items[k])
                                break;
                            cnt++;
                        }
                        if (cnt == 7)
                        {
                            samecnt++;
                            mark[j] = true;
                            break;
                        }
                    }
                }
            }
            return samecnt * 200.0 / (a.Count() + b.Count());
        }
    };

    //define words unit value
    enum TokenValue
    {
        TOK_COMMA,
        TOK_DIV,
        TOK_END,
        TOK_EQUAL,
        TOK_FOR,
        TOK_ID,
        TOK_IF,
        TOK_INTEGER,
        TOK_MINUS,
        TOK_MULT,
        TOK_PLUS,
        TOK_SEMICOLON,
        TOK_UNDEFINED,
        TOK_WHILE,
        TOK_LPAR,
        TOK_RPAR,
        TOK_LMIB,
        TOK_RMIB,
        TOK_LSQU,
        TOK_RSQU,
        TOK_LT,
        TOK_GT,
        TOK_LE,
        TOK_GE,
        TOK_NT,
        TOK_NE,
    };

    class TOKEN
    {
        private static string[] TOKEN_VALUE_DESCRIPTION = new string[]
        {
                        "TOK_COMMA",
                        "TOK_DIV",
                        "TOK_END",
                        "TOK_EQUAL",
                        "TOK_FOR",
                        "TOK_ID",
                        "TOK_IF",
                        "TOK_INTEGER",
                        "TOK_MINUS",
                        "TOK_MULT",
                        "TOK_PLUS",
                        "TOK_SEMICOLON",
                        "TOK_UNDEFINED",
                        "TOK_WHILE",
                        "TOK_LPAR",
                        "TOK_RPAR",
                        "TOK_LMIB",
                        "TOK_RMIB",
                        "TOK_LSQU",
                        "TOK_RSQU",
                        "TOK_LT",
                        "TOK_GT",
                        "TOK_LE",
                        "TOK_GE",
                        "TOK_NT",
                        "TOK_NE",
        };

        //label and label's value
        public class Token
        {
            public int type;
            public string str;

            public Token(int _type, string _str)
            {
                type = _type;
                str = _str;
            }
        };

        public List<Token> token = new List<Token>();

        public static bool IsNumeric(string value)
        {
            return Regex.IsMatch(value, @"^[+-]?/d*[.]?/d*$");
        }
        public static bool IsWord(string input)
        {
            string pattern = @"^[A-Za-z]+$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(input);
        }

        //The input parameter is path
        public int Lexer(string path)
        {
            token.Clear();
            StreamReader fin = new StreamReader(path, Encoding.Default);
            string line;
            while ((line = fin.ReadLine()) != null)
            {
                string buf = "";
                string p = "";
                for (int i = 0; i < line.Length; ++i)
                {
                    if (line[i] < ' ') continue;                  // [\n\t ]
                    p = buf;
                    switch (line[i])
                    {
                        case '+': token.Add(new Token((int)TokenValue.TOK_PLUS, "+")); break;
                        case '-': token.Add(new Token((int)TokenValue.TOK_MINUS, "-")); break;
                        case '*': token.Add(new Token((int)TokenValue.TOK_MINUS, "*")); break;
                        case ';': token.Add(new Token((int)TokenValue.TOK_SEMICOLON, ";")); break;
                        case '=': token.Add(new Token((int)TokenValue.TOK_EQUAL, "=")); break;
                        case ',': token.Add(new Token((int)TokenValue.TOK_COMMA, ",")); break;
                        case '{': token.Add(new Token((int)TokenValue.TOK_LMIB, "{")); break;
                        case '}': token.Add(new Token((int)TokenValue.TOK_RMIB, "}")); break;
                        case '(': token.Add(new Token((int)TokenValue.TOK_LPAR, "(")); break;
                        case ')': token.Add(new Token((int)TokenValue.TOK_RPAR, ")")); break;
                        case '[': token.Add(new Token((int)TokenValue.TOK_LSQU, "[")); break;
                        case ']': token.Add(new Token((int)TokenValue.TOK_RSQU, "]")); break;
                        case '<':
                            if (i + 1 < line.Length && line[i + 1] == '=')
                            {
                                i++;
                                token.Add(new Token((int)TokenValue.TOK_LE, "<="));
                            }
                            else
                            {
                                token.Add(new Token((int)TokenValue.TOK_LT, "<"));
                            }
                            break;
                        case '>':
                            if (i + 1 < line.Length && line[i + 1] == '=')
                            {
                                i++;
                                token.Add(new Token((int)TokenValue.TOK_GE, ">="));
                            }
                            else
                            {
                                token.Add(new Token((int)TokenValue.TOK_GT, ">"));
                            }
                            break;
                        case '!':
                            if (i + 1 < line.Length && line[i + 1] == '=')
                            {
                                i++;
                                token.Add(new Token((int)TokenValue.TOK_NE, "!="));
                            }
                            else
                            {
                                token.Add(new Token((int)TokenValue.TOK_NT, "!"));
                            }
                            break;
                        default:
                            break;
                    }
                    if (i < line.Length && IsWord(line[i].ToString()))                          // [A-Za-z][A-Za-z0-9],Start with a letter
                    {
                        p += line[i];
                        while (i < line.Length)
                        {
                            if (!(IsNumeric(line[i].ToString()) || IsWord(line[i].ToString()) || line[i] == '_'))    //Is a word, numeric, _
                            {
                                i--;
                                break;
                            }
                            p += line[i];
                            i++;
                        }
                        token.Add(new Token((int)TokenValue.TOK_ID, p));
                    }
                    if (i < line.Length && IsNumeric(line[i].ToString()))                   // [0-9]+
                    {
                        p += line[i];
                        while (i < line.Length)
                        {
                            if (!IsNumeric(line[i].ToString()))
                            {
                                i--;
                                break;
                            }
                            p += line[i];
                            i++;
                        }
                        token.Add(new Token((int)TokenValue.TOK_INTEGER, p));
                    }
                }
            }
            fin.Close();
            return token.Count();
        }
        //Read the file
        public List<string> Read_file(string filename)
        {
            List<string> tmp = new List<string> { "#" };
            int nToken = Lexer(filename);

            for (int n = 0; n < nToken; n++)
            {
                tmp.Add(TOKEN_VALUE_DESCRIPTION[token[n].type] + ":" + token[n].str);
            }
            return tmp;
        }

    };
    class Sim
    {
        public int max(int a, int b)
        {
            return a > b ? a : b;
        }
        //Return comparison score
        public int Check_Equal(string s1, string s2)
        {
            if (s1 == s2)
            {
                if (s1.Contains("TOK_ID"))
                    return 2;
                return 1;
            }
            if (s1.Contains("TOK_ID") && s2.Contains("TOK_ID"))
                return 0;
            return -2;
        }
        //Calculate the total score
        public int Total_Score(List<string> s, List<string> t)
        {
            int[,] dp = new int[s.Count(), t.Count()];

            for (int i = 1; i <= t.Count() - 1; i++)
                dp[1, i] = i * (-2);
            for (int i = 1; i <= s.Count() - 1; i++)
                dp[i, 1] = i * (-2);
            int MaxScore = 0;
            for (int i = 1; i <= s.Count() - 1; i++)
            {
                for (int j = 1; j <= t.Count() - 1; j++)
                {
                    dp[i, j] = max(0, max(dp[i, j - 1] - 2, max(dp[i - 1, j - 1] + Check_Equal(s[i], t[j]), dp[i - 1, j] - 2)));
                    MaxScore = max(dp[i, j], MaxScore);
                }
            }
            return MaxScore;
        }

        //Calculate the score of each function module
        public int Block_Score(List<string> s, List<string> t)
        {
            List<string> tmp = new List<string>(1000);
            Stack stk = new Stack();
            int tot = 0, m_tot = 0;
            int tidx = 1;
            for (int i = 1; i < s.Count; i++)
            {
                m_tot = 0;
                if (s[i].Contains("TOK_LMIB"))
                {
                    if (stk.Count > 0)
                    {
                        tmp.Add("#");
                        for (int j = tidx; j < i; j++)
                            tmp.Add(s[j]);
                        m_tot = Total_Score(tmp, t);
                        tmp.Clear();
                        tidx = i;
                    }
                    stk.Push('{');
                }
                else if (s[i].Contains("TOK_RMIB"))
                {
                    if (stk.Count == 0)
                        stk.Pop();
                    if (stk.Count > 0)
                    {
                        tmp.Add("#");
                        for (int j = tidx; j <= i; j++)
                            tmp.Add(s[j]);
                        m_tot = Total_Score(tmp, t);
                        tmp.Clear();
                        tidx = i + 1;
                    }
                }
                tot += m_tot;
            }
            return tot;
        }
        //Gets the code similarity of the two files
        public double Sim_Run(List<string> s, List<string> t)
        {
            if (s.Count == 1 || t.Count == 1)
                return 0;
            return 200.0 * Block_Score(s, t) / (Total_Score(s, s) + Total_Score(t, t));
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

        protected void Bt_upload_Click(object sender, EventArgs e)
        {
            if (Request.Files["file"].ContentLength > 0)
            {
                string FileName = Path.GetFileName(Request.Files["file"].FileName);
                string type = FileName.Substring(FileName.LastIndexOf(".") + 1);
                if (type == "cpp" || type == "java")
                {
                    Request.Files["file"].SaveAs(Server.MapPath("../Files/") + Path.GetFileName(Request.Files["file"].FileName));
                    Upload_info.Text = "上传成功！";
                }
                else
                {
                    Upload_info.Text = "文件类型必须是cpp或者java！";
                }
            }
            else
            {
                Upload_info.Text = "请上传文件！";
            }
        }

        protected void Bt_excute_Click(object sender, EventArgs e)
        {
            System.IO.DirectoryInfo DirInfo = new System.IO.DirectoryInfo(Server.MapPath("../Files/"));
            if (!DirInfo.Exists) return;

            System.IO.DirectoryInfo[] Dirs = DirInfo.GetDirectories();

            //获取文件路径集合
            FileInfo[] paths = DirInfo.GetFiles("*.cpp");
            List<string> files = new List<string>();
            //循环paths 将每个文件信息放入List里
            foreach (FileInfo filepath in paths)
            {
                files.Add(filepath.FullName);
            }
            if (paths.Count() <= 1)
            {
                Response.Write("<script>alert('相同类型的文件数少于两个')</script>");
            }
            else
            {
                TOKEN GenerateToken = new TOKEN();
                Sim CalculateSimScore = new Sim();
                DFA CalculateDFAScore = new DFA();
                List<VN> Markfile1 = new List<VN>();
                List<VN> Markfile2 = new List<VN>();

                CalculateDFAScore.Get_VN(files[0], Markfile1);
                CalculateDFAScore.Get_VN(files[1], Markfile2);

                double SimScore = CalculateSimScore.Sim_Run(GenerateToken.Read_file(files[0]), GenerateToken.Read_file(files[1]));
                double DFAScore = CalculateDFAScore.Get_varsim(Markfile1, Markfile2);

                double TotalScore = DFAScore * 0.4 + SimScore * 0.6;
                //System.Diagnostics.Debug.WriteLine(Markfile1.Count());
                Excute_info.Text = "代码相似度：" + TotalScore.ToString() + "%";
            }
        }
        

        protected void Bt_upload_Click2(object sender, EventArgs e)
        {

        }

        protected void Bt_excute_Click2(object sender, EventArgs e)
        {

        }
    }
}