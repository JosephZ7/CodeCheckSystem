#include <stdio.h>
#include<math.h>
#include<cstring>
#include<iostream>
#include<algorithm>
#define LL long long
const int mod = 998244353;
const int MAX_N = 5e4+10;
const double eps=1e-6;
using namespace std;
int s[200],c[200];
int dp[20005],stk[300],vis[300][20005],top,cost;
void Find(int n,int m)
{
    if(n == 0)
        return ;
    if(vis[n][m] == 0)
        Find(n-1,m);
    else
    {
        Find(n-1,m-c[n]);
        cost+=c[n];
        stk[top++] = n;
    }
}
int main()
{
    int T,ti = 1;
    scanf("%d",&T);
    while(T--)
    {
        int B,N;
        top = 0;
        memset(dp,0,sizeof(dp));
        memset(vis,0,sizeof(vis));
        scanf("%d",&B);
        scanf("%d",&N);
        for(int i = 1;i <= N;i++)
            scanf("%d%d",&s[i],&c[i]);
        printf("Case #%d:\n",ti++);
        for(int i = 1;i <= N;i++)
        {
            for(int j = B;j >= c[i];j--)
            {
                if(dp[j] < dp[j-c[i]]+s[i])
                {
                    dp[j] = dp[j-c[i]]+s[i];
                    vis[i][j] = 1;
                }
            }
        }
        int i;
        cost = 0;
        Find(N,B);
        printf("%d %d\n",dp[B],cost);
        sort(stk,stk+top);
        for(i = 0;i < top;i++)
        {
            if(i == top-1)
                printf("%d\n",stk[i]);
            else
                printf("%d ",stk[i]);
        }
    }
    return 0;
}
