#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <algorithm>
#include <map>
#include <queue>
#include <vector>
#include <iostream>
#define LL long long
#define INF 0x3f3f3f3f
const int MAX_N = 5e5+10;
const LL mod = 1e9+7;
using namespace std;
int a[205];
int dp[205][205];
int main()
{
    int N;
    scanf("%d",&N);
    for(int i = 0;i < N;i++)
        scanf("%d",&a[i]);
    for(int i = 0;i < N;i++)
    {
        for(int j = 0;j < N;j++)
            dp[i][j] = INF;
        dp[i][i] = 0;
    }
    for(int l = 1;l < N-1;l++)
    {
        for(int i = 1;i+l < N;i++)
        {
            int j = i+l;
            for(int k = i;k < j;k++)
                dp[i][j] = min(dp[i][j],dp[i][k]+dp[k+1][j]+a[i-1]*a[k]*a[j]);
        }
    }
    printf("%d\n",dp[1][N-1]);
    return 0;
}
/*
*/
