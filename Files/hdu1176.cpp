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
const int MAX_N = 1e5+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;


int dp[MAX_N][20];
int main()
{
    int n;
    while(scanf("%d",&n)!=EOF)
    {
        if(n == 0) break;
        for(int i = 0;i < MAX_N;i++)
            for(int j = 0;j <= 10;j++)
                dp[i][j] = 0;
        int x,t,Mt = 0;
        for(int i = 0;i < n;i++)
        {
            scanf("%d%d",&x,&t);
            dp[t][x]++;
            Mt = max(t,Mt);
        }
        for(int i = Mt-1;i >= 0;i--)
        {
            for(int j = 0;j <= 10;j++)
            {
                dp[i][j]+= max(dp[i+1][j+1],max(dp[i+1][j],dp[i+1][j-1]));
            }
        }
        printf("%d\n",dp[0][5]);
    }
    return 0;
}
/*
*/
