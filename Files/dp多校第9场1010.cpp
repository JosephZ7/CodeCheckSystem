#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <queue>
#include <map>
#include <stack>
#include <algorithm>
#include <iostream>
#define LL long long
#define INF 0x7fffffff
//#pragma comment(linker, "/STACK:1024000000,1024000000")
using namespace std;
const int MAX_N = 2e3+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;
char s1[3000],s2[3000];
int dp[3005][3005];
int main()
{
    int T;
    scanf("%d",&T);
    while(T--)
    {
        memset(dp,0,sizeof(dp));
        scanf("%s",s1+1);
        scanf("%s",s2+1);
        int n = strlen(s1+1);
        int m = strlen(s2+1);
        dp[0][0] = 1;
        for(int i = 1;i <= n;i++)
        {
            for(int j = 1;j <= m;j++)
            {
                if(s1[i] == s2[j]||s2[j] == '.')
                    dp[i][j] = dp[i-1][j-1];
                else if(s2[j] == '*')
                {
                    if(dp[i-1][j-2]) dp[i-1][j] = 1;
                    if(dp[i][j-2]||dp[i][j-1]) dp[i][j] = 1;
                    if(dp[i-1][j-1]&&s1[i] == s1[i-1]) dp[i][j] = 1;
                    if(dp[i-1][j]&&s1[i] == s1[i-1]) dp[i][j] = 1;
                }
                else
                    dp[i][j] = 0;
            }
        }
        if(dp[n][m])
            printf("yes\n");
        else
            printf("no\n");
    }
    return 0;
}
/*
*/
