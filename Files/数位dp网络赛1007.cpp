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

int num[105],dnum[105];
LL dp[105][105][2][40];
LL dfs(int len,int tlen,int sta,int jin,int flag)
{
    if(len == 0)
        return sta?jin:1;
    if(!flag&&dp[len][tlen][sta][jin]!=-1)
        return dp[len][tlen][sta][jin];
    int n = flag?num[len]:jin-1;
    LL ans = 0;
    for(int i = 0;i <= n;i++)
    {
        dnum[len] = i;
        if(tlen == len&&i == 0)
            ans+=dfs(len-1,tlen-1,sta,jin,flag&&i == n);
        else if(sta&&len <= tlen/2)
            ans+=dfs(len-1,tlen,sta&&dnum[tlen-len+1] == i,jin,flag&&i == n);
        else
            ans+=dfs(len-1,tlen,sta,jin,flag&&i == n);
    }
    if(!flag)
        dp[len][tlen][sta][jin] = ans;
    return ans;
}
LL solve(int x,int jin)
{
    int k = 0;
    while(x)
    {
        num[++k] = x%jin;
        //cout<<x%jin<<endl;
        x/=jin;
    }
    return dfs(k,k,1,jin,1);
}
int main()
{
    int T,ti = 1;
    memset(dp,-1,sizeof(dp));
    scanf("%d",&T);
    while(T--)
    {
        int L,R,l,r;
        scanf("%d%d%d%d",&L,&R,&l,&r);
        LL ans = 0;
        for(int i = l;i <= r;i++)
            ans+=solve(R,i)-solve(L-1,i);
        printf("Case #%d: %lld\n",ti++,ans);
    }
    return 0;
}
/*
*/
