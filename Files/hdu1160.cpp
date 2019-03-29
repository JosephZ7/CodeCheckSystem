#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <cstring>
#include <queue>
#include <algorithm>
#include <iostream>
#define LL long long
const int MAX_N = 1e6+10;
const double eps = 1e-8;
const LL mod = 1e9+7;
using namespace std;

LL q_pow(LL a,LL b){LL tmp; for(tmp = 1;b;b>>=1,a*=a) if(b&1) tmp*=a; return tmp;}

struct node
{
    int w,s;
    int id;
}a[1005];
int dp[1005],pre[1005];
bool cmp(const node &e1,const node &e2)
{
    if(e1.w == e2.w)
        return e1.s > e2.s;
    return e1.w < e2.w;
}
void print(int f)
{
    if(f == -1) return ;
    print(pre[f]);
    printf("%d\n",a[f].id);
}
int main()
{
    //freopen("in.txt","r",stdin);
    int n = 1;
    memset(pre,-1,sizeof(pre));
    memset(dp,0,sizeof(dp));
    while(scanf("%d%d",&a[n].w,&a[n].s)!=EOF)
    {
        a[n].id = n;
        n++;
    }
    n--;
    sort(a+1,a+n+1,cmp);
    int ans = 0,f = -1;
    for(int i = 2;i <= n;i++)
    {
        dp[i] = 1;
        for(int j = 1;j < i;j++)
        {
            if(a[i].w > a[j].w&&a[i].s < a[j].s&&dp[i] < dp[j]+1)
            {
                dp[i] = dp[j]+1;
                pre[i] = j;
            }
        }
        if(ans < dp[i]) ans = dp[i],f = i;
    }
    printf("%d\n",ans);
    print(f);
    return 0;
}
/*
*/
