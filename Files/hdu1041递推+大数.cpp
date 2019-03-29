#include<cstdio>
#include<cstring>
#include<iostream>
#include<algorithm>
#define LL long long
using namespace std;
const int MAX_N = 1e3 + 10;
const int mod = 998244353;
string calc(string a,string b)
{
    int na[1005] = {0},nb[1005] = {0};
    int nc[1005] = {0};
    int la = a.size(),lb = b.size();
    for(int i = 0;i < la;i++)
        na[i] = a[la-i-1]-'0';
    for(int i = 0;i < lb;i++)
        nb[i] = b[lb-i-1]-'0';
    int ml = max(la,lb),c = 0;
    for(int i = 0;i < ml;i++)
    {
        nc[i] = (na[i]+nb[i]+c)%10;
        c = (na[i]+nb[i]+c)/10;
    }
    if(c) nc[ml] = c,ml++;
    string ans = "";
    for(int i = 0;i < ml;i++)
        ans = (char)(nc[i]+'0')+ans;
    return ans;
}
string fa[1005],fb[1005];
void init()
{
    fa[0] = "0",fb[0] = "0";
    for(int i = 1;i < 1001;i++)
    {
        fa[i] = calc(fa[i-1],fb[i-1]);
        fb[i] = calc(fa[i-1],fb[i-1]);
        fb[i] = calc(fb[i],i&1 == 1?"1":"0");
    }
}
int main()
{
    int n;
    init();
    while(scanf("%d",&n)!=EOF)
    {
        cout<<fb[n-1]<<endl;
    }
    return 0;
}
