#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <string>
#include <algorithm>
#include <iostream>
#define PI 3.141592653589793
#define LL long long
#define MAX 0x3fffffff
#define INF 0x3f3f3f3f
#define mem(a,v) memset(a,v,sizeof(a))
const int MAX_N = 1e3+10;
const double eps = 1e-8;
const LL mod = 1000000009;
const LL inf = 1e15+5;
using namespace std;
int a[MAX_N],dp[MAX_N][MAX_N];
int main()
{
    int n;
    while(scanf("%d",&n),n)
    {
        mem(dp,0);
        for(int i = 1;i <= n;i++)
        {
            scanf("%d",&a[i]);
            dp[i][i] = 1;
        }
        for(int i = 2;i <= n;i++)
        {
            for(int j = 1;j+i-1 <= n;j++)
            {
                int k = i+j-1;
                dp[j][k] = max(dp[j][k],max(dp[j+1][k],dp[j][k-1]));
                if(a[j] == a[k])
                    dp[j][k] = max(dp[j][k],dp[j+1][k-1]+2);
            }
        }
        int ans = 0;
        for(int i = 1;i <= n;i++)
            ans = max(ans,dp[1][i]+dp[i+1][n]);
        cout<<ans<<endl;
    }
    return 0;
}
