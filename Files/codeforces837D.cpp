#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <cstring>
#include <algorithm>
#include <queue>
#include <map>
#include <stack>
#include <iostream>
#define PI acos(-1)
#define LL long long
#define INF 0x3f3f3f3f
#define mem(a,v) memset(a,v,sizeof(a))
const int MAX_N = 1e4+10;
const double eps = 1e-8;
const LL inf = 1e18+10;
using namespace std;
LL a[200];
int dp[233][5200];
int main()
{
    int n,k;
    scanf("%d%d",&n,&k);
    for(int i = 0;i < n;i++)
        scanf("%I64d",&a[i]);
    memset(dp,-1,sizeof(dp));
    dp[0][0] = 0;
    for(int i = 0;i < n;i++)
    {
        LL tmp = a[i];
        int f2 = 0,f5 = 0;
        while(tmp%2 == 0) f2++,tmp/=2;
        while(tmp%5 == 0) f5++,tmp/=5;
        for(int j = k-1;j >= 0;j--)
        {
            for(int g = 0;g < 5200;g++)
            {
                if(dp[j][g]!=-1)
                    dp[j+1][g+f5] = max(dp[j+1][g+f5],dp[j][g]+f2);
            }
        }
    }
    int ans = 0;
    for(int i = 0;i < 5200;i++)
    {
        ans = max(ans,min(i,dp[k][i]));
    }
    cout<<ans<<endl;
    return 0;
}
/*
*/
