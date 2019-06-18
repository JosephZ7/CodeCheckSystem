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

LL q_pow(LL a,LL b) { LL tmp;for(tmp = 1;b;b>>=1,a*=a) if(b&1) tmp*=a; return tmp;}

int a[1005],dp[1005];
int main()
{
    int N;
    while(scanf("%d",&N)&&N)
    {
        memset(dp,0,sizeof(dp));
        for(int i = 0;i < N;i++)
            scanf("%d",&a[i]);
        int ans = 0;
        dp[0] = a[0];
        for(int i = 1;i < N;i++)
        {
            dp[i] = a[i];
            for(int j = 0;j < i;j++)
            {
                if(a[j] < a[i])
                    dp[i] = max(dp[i],dp[j]+a[i]);
            }
            ans = max(ans,dp[i]);
        }
        printf("%d\n",ans);
    }
    return 0;
}
/*
*/
