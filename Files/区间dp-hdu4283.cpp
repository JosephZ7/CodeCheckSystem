#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <queue>
#include <stack>
#include <algorithm>
#include <iostream>
#define LL long long
#define INF 0x7fffffff
using namespace std;
const int MAX_N = 1e3+10;
const LL inf = 1e15+10;
const LL mod = 1e6+3;
const double eps = 1e-8;
int dp[205][205];
int D[205],sum[205];
int main()
{
    int T,ti = 1;
    scanf("%d",&T);
    while(T--)
    {
        int n;
        scanf("%d",&n);
        sum[0] = 0;
        for(int i = 1;i <= n;i++)
        {
            scanf("%d",&D[i]);
            sum[i] = sum[i-1]+D[i];
        }
        memset(dp,0,sizeof(dp));
        for(int l = 1;l < n;l++)
        {
            for(int i = 1;i+l <= n;i++)
            {
                int j = i+l;
                dp[i][j] = INF;
                for(int k = i;k <= j;k++)
                    dp[i][j] = min(dp[i][j],dp[i+1][k]+dp[k+1][j]+(k-i)*D[i]+(k-i+1)*(sum[j]-sum[k]));
            }
        }
        printf("Case #%d: ",ti++);
        printf("%d\n",dp[1][n]);
    }
    return 0;
}
/*
2
5
1 2 3 4 5
5
5 4 3 2 2
*/
