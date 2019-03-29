#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <queue>
#include <algorithm>
#include <iostream>
#define LL long long
#define INF 0x7fffffff
using namespace std;
int num[100];
LL dp[105][1<<10][11];
int K;
int judge(int sta,int x)
{
    for(int i = x;i < 10;i++)
        if(sta&(1<<i))
            return (sta^(1<<i))|(1<<x);
    return sta|(1<<x);
}
int getlen(int sta)
{
    int ans = 0;
    while(sta)
    {
        if(sta&1)
            ans++;
        sta>>=1;
    }
    return ans;
}
LL dfs(int len,int sta,int lead,int flag)
{
    if(len == 0)
        return getlen(sta) == K;
    if(!flag&&dp[len][sta][K]!=-1)
        return dp[len][sta][K];
    int n = flag?num[len]:9;
    LL ans = 0;
    for(int i = 0;i <= n;i++)
    {
        ans+=dfs(len-1,(lead == 0&&i == 0)?0:judge(sta,i),lead||i,flag&&i == n);
    }
    if(!flag)
        dp[len][sta][K] = ans;
    return ans;
}
LL solve(LL x)
{
    int len = 0;
    while(x)
    {
        num[++len] = x%10;
        x/=10;
    }
    return dfs(len,0,0,1);
}
int main()
{
    memset(dp,-1,sizeof(dp));
    int T,ti = 1;
    LL L,R;
    scanf("%d",&T);
    while(T--)
    {
        scanf("%lld%lld%d",&L,&R,&K);
        printf("Case #%d: ",ti++);
        printf("%lld\n",solve(R)-solve(L-1));
    }
    return 0;
}
