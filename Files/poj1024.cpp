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
//#pragma comment(linker, "/STACK:1024000000,1024000000")
using namespace std;
const int MAX_N = 1e6+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;
int a[MAX_N];
int dp[MAX_N],Max[MAX_N];
int main()
{
    int n,m;
    while(scanf("%d%d",&m,&n)!=EOF)
    {
        for(int i = 1;i <= n;i++)
        {
            scanf("%d",&a[i]);
            dp[i] = Max[i] = 0;
        }
        dp[0] = Max[0] = 0;
        int Ma;
        for(int i = 1;i <= m;i++)
        {
            Ma = -INF;
            for(int j = i;j <= n;j++)
            {
                dp[j] = max(dp[j-1]+a[j],Max[j-1]+a[j]);
                Max[j-1] = Ma;
                Ma = max(Ma,dp[j]);
            }
        }
        printf("%d\n",Ma);
    }
    return 0;
}
/*
*/
