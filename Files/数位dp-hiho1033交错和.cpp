#include<cstdio>
#include<cstring>
#include<iostream>
#include<algorithm>
#include<queue>
#include<string>
#include<math.h>
#include<map>
#include<set>
#define LL long long
using namespace std;
const int MAX_N = 1e6+10;
const int mod = 1e9+7;
LL l,r,k;
int num[100],len,tl;
LL bit[200];
struct node
{
    LL wn,sv;
} dp[105][400];
node dfs(int pos,int sum,int flag)
{
    node tmp,ans;
    tmp.wn = tmp.sv = ans.wn = ans.sv = 0;
    if(pos == 0)
    {
        if(sum == 200)
            tmp.wn = 1;
        return tmp;
    }
    if(!flag&&dp[pos][sum].wn!=-1)
        return dp[pos][sum];
    int sn = pos == tl?1:0;
    int dn = flag?num[pos]:9;
    int f = ((tl-pos)%2?1:-1);
    for(int i = sn;i <= dn;i++)
    {
        tmp = dfs(pos-1,sum+f*i,i == dn&&flag);
        if(tmp.wn)
        {
            ans.wn+=tmp.wn;
            LL t = tmp.wn%mod*i%mod*bit[pos]%mod;
            ans.sv = (ans.sv+tmp.sv)%mod;
            ans.sv = (ans.sv+t)%mod;
        }
    }
    if(!flag)
        dp[pos][sum] = ans;
    return ans;
}
LL solve(LL x)
{
    len = 0;
    while(x)
    {
        num[++len] = x%10;
        x/=10;
    }
    LL sum = 0;
    for(tl = 1;tl <= len;tl++)
    {
        memset(dp,-1,sizeof(dp));
        sum = (sum+dfs(tl,k+200,tl == len).sv)%mod;
    }
    return sum;
}
LL q_pow(LL a,LL b)
{
    LL tmp = 1;
    while(b)
    {
        if(b&1)
            tmp = tmp*a%mod;
        b>>=1;
        a = a*a%mod;
    }
    return tmp%mod;
}
int main()
{
    memset(dp,-1,sizeof(dp));
    for(int i = 1;i < 20;i++)
    {
        bit[i] = q_pow(10,i-1);
    }
    scanf("%lld%lld%lld",&l,&r,&k);
    printf("%lld\n",(solve(r)-solve(l-1)+mod)%mod);
    return 0;
}
