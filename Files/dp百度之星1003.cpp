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
const int MAX_N = 1e5+10;
const double eps = 1e-8;
const LL inf = 1e18+10;
using namespace std;
struct moster
{
    int a,b;
}mo[MAX_N];
struct attack
{
    LL k;
    int p;
}atk[1005];

LL dp[1005][15];
int main()
{
    int n,m;
    while(scanf("%d%d",&n,&m)!=EOF)
    {
        for(int i = 0;i < n;i++)
            scanf("%d%d",&mo[i].a,&mo[i].b);
        for(int i = 0;i < m;i++)
            scanf("%I64d%d",&atk[i].k,&atk[i].p);
        for(int i = 1;i <= 1001;i++)
            for(int j = 0;j <= 10;j++)
                dp[i][j] = inf;
        for(int j = 0;j <= 10;j++)
            dp[0][j] = 0;
        for(int j = 0;j <= 10;j++)
            for(int d = 0;d <= 1001;d++)
                for(int i = 0;i < m;i++)
                    if(j < atk[i].p)
                        dp[d][j] = min(dp[d][j],dp[max(0,d-atk[i].p+j)][j]+atk[i].k);
        LL ans = 0;
        int flag = 0;
        for(int i = 0;i < n;i++)
        {
            if(dp[mo[i].a][mo[i].b] == inf) continue;
            flag++;
            ans+=dp[mo[i].a][mo[i].b];
        }
        if(flag != n)
            printf("-1\n");
        else
            printf("%I64d\n",ans);
    }
    return 0;
}
/*
*/
