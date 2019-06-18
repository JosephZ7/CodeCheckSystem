#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <algorithm>
#include <iostream>
#define LL long long
using namespace std;
int dp[30][30][30];
int num[30];
int dfs(int len,int n0,int n1,int pre,int flag)
{
    if(len == 0)
        return n0>=n1;

    if(!pre&&!flag&&dp[len][n0][n1]!=-1)
        return dp[len][n0][n1];
    int n = flag ? num[len]:1;
    int ans = 0;
    for(int i = 0;i <= n;i++)
    {
        ans+=dfs(len-1,n0+(!i&&!pre),n1+i,pre&&i == 0,flag&&i == n);
    }
    if(!flag)
        dp[len][n0][n1] = ans;
    return ans;
}
int solve(int x)
{
    int len = 0;
    while(x)
    {
        num[++len] = x%2;
        x /=2;
    }
    return dfs(len,0,0,1,1);
}
int main()
{
    int l,r;
    memset(dp,-1,sizeof(dp));
    scanf("%d%d",&l,&r);
    printf("%d\n",solve(r)-solve(l-1));
    return 0;
}
