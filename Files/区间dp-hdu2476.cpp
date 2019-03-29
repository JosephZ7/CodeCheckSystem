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
int main()
{
    string s1,s2;
    while(cin>>s1>>s2)
    {
        int len = s1.size();
        memset(dp,0,sizeof(dp));
        for(int i = 0;i < len;i++)
            dp[i][i] = 1;
        for(int l = 1;l < len;l++)
        {
            for(int i = 0;i+l < len;i++)
            {
                int j = i+l;
                dp[i][j] = dp[i+1][j]+1;
                for(int k = i+1;k <= j;k++)
                    if(s2[i] == s2[k])
                        dp[i][j] = min(dp[i][j],dp[i+1][k]+dp[k+1][j]);
            }
        }
        for(int i = 0;i < len;i++)
        {
            if(s1[i] == s2[i])
            {
                if(i == 0)
                    dp[0][i] = 0;
                else
                    dp[0][i] = dp[0][i-1];
            }
            for(int j = 0;j < i;j++)
                dp[0][i] = min(dp[0][i],dp[0][j]+dp[j+1][i]);
        }
        printf("%d\n",dp[0][len-1]);
    }
    return 0;
}
