#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <algorithm>
#include <iostream>
#define LL long long
using namespace std;
int dp[10][15][2][20];
int num[30];
int dfs(int len,int mod,int zai,int pre,int flag)
{
    if(len == 0)
        return !mod&&zai;
    if(!flag&&dp[len][mod][zai][pre]!=-1)
        return dp[len][mod][zai][pre];
    int n = flag ? num[len]:9;
    int ans = 0;
    for(int i = 0;i <= n;i++)
    {
        int t = 0;
        if(pre == 1&&i == 3)
            t = 1;
        ans+=dfs(len-1,(mod*10+i)%13,zai||t,i,flag&&i == n);
        //printf("%d %d %d %d\n",len,pre,i,ans);
    }
    if(!flag)
        dp[len][mod][zai][pre] = ans;
    return ans;
}
int solve(int x)
{
    int len = 0;
    while(x)
    {
        num[++len] = x%10;
        x /=10;
    }
    return dfs(len,0,0,0,1);
}
int main()
{
    int n;
    memset(dp,-1,sizeof(dp));
    while(scanf("%d",&n)!=EOF)
    {
        printf("%d\n",solve(n));
    }

    return 0;
}
