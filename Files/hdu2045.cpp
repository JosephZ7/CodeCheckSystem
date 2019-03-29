#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <cstring>
#include <algorithm>
#include <iostream>
#define LL long long
#define INF 0x7fffffff
#define PLL pair<LL,LL>
//#pragma comment(linker, "/STACK:1024000000,1024000000")
using namespace std;
const int MAX_N = 1e5+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;

LL dp[100][3];
int main()
{
    int n;
    while(scanf("%d",&n)!=EOF)
    {
        LL ans = 0;
        if(n == 1)
        {
            printf("3\n");
            continue;
        }
        memset(dp,0,sizeof(dp));
        dp[1][0] = 1;
        for(int i = 2;i <= n;i++)
        {
            dp[i][0] = dp[i-1][1]+dp[i-1][2];
            dp[i][1] = dp[i-1][0]+dp[i-1][2];
            dp[i][2] = dp[i-1][1]+dp[i-1][0];
        }
        ans = dp[n][2]+dp[n][1];
        cout<<ans*3<<endl;
    }
    return 0;
}
/*
*/
