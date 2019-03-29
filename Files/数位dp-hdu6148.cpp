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

char s[105]; int len,num[105];
LL dp[105][20][2];
LL dfs(int p,int pre,int up,int lead,int flag)
{
    if(p == 0)
        return 1;
    if(!flag&&!lead&&dp[p][pre][up]!=-1)
        return dp[p][pre][up];
    int n = flag?num[p]:9;
    LL ans = 0;
    for(int i = 0;i <= n;i++)
    {
        if(pre == 11&&i == 0)
        {
            ans+=dfs(p-1,11,0,lead,flag&&i == n);
            ans%=mod;
            continue;
        }
        if(pre < i)
            ans+=dfs(p-1,i,1,lead&&i == 0,flag&&i == n);
        else if(pre > i)
        {
            if(up) continue;
            ans+=dfs(p-1,i,up,lead&&i == 0,flag&&i == n);
        }
        else if(pre == i)
            ans+=dfs(p-1,i,up,lead&&i == 0,flag&&i == n);
        ans%=mod;
    }
    if(!flag&&!lead)
        dp[p][pre][up] = ans;
    return ans;
}
int main()
{
    int T;
    memset(dp,-1,sizeof(dp));
    scanf("%d",&T);
    while(T--)
    {
        scanf("%s",s);
        len = strlen(s);
        int k = 0;
        for(int i = len-1;i >= 0;i--)
            num[++k] = s[i]-'0';
        printf("%I64d\n",dfs(k,11,0,1,1)%mod-1);
    }
    return 0;
}
/*
555555555555555555
*/
