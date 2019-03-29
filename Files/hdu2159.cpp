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
const int MAX_N = 1e5+10;
const double eps = 1e-8;
const LL mod = 1000000009;
const LL inf = 1e15+5;
using namespace std;
struct node
{
    int a,b;
}f[2000];
int dp[200][200];
int main()
{
    int n,m,k,s;
    while(scanf("%d%d%d%d",&n,&m,&k,&s)!=EOF)
    {
        for(int i = 1;i <= k;i++)
            scanf("%d%d",&f[i].a,&f[i].b);
        mem(dp,0);
        int flag = 1;
        for(int i = 1;i <= k;i++)
            for(int j = f[i].b;j <= m;j++)
                for(int g = s;g >= 1;g--)
                    dp[j][g] = max(dp[j][g],dp[j-f[i].b][g-1]+f[i].a);
        int ans;
        for(int i = 0;i <= m&&flag;i++)
            for(int j = 0;j <= s&&flag;j++)
                if(dp[i][j] >= n)
                {
                    flag = 0;
                    ans = i;
                }
        if(!flag)
            printf("%d\n",m-ans);
        else
            printf("-1\n");
    }
    return 0;
}
