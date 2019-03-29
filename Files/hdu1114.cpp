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
const int MAX_N = 1e6+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;


struct coins
{
    int p,w;
}c[1000];
LL dp[20005];
int main()
{
    int T;
    scanf("%d",&T);
    while(T--)
    {
        for(int i = 0;i < 20005;i++)
            dp[i] = INF;
        int E,F,N,i,j;
        scanf("%d%d",&E,&F);
        int rong = F-E;
        scanf("%d",&N);
        for(int i = 0;i < N;i++)
            scanf("%d%d",&c[i].p,&c[i].w);
        dp[0] = 0;
        for(j = 0;j < N;j++)
        {
            for(i = 0;i <= rong-(rong%c[j].w);i++)
                dp[i+c[j].w] = min(dp[i+c[j].w],dp[i]+c[j].p);
            //cout<<dp[i+c[j].w]<<endl;
        }

        if(dp[rong] == INF)
            printf("This is impossible.\n");
        else
            printf("The minimum amount of money in the piggy-bank is %lld.\n",dp[rong]);
    }
    return 0;
}
/*
*/
