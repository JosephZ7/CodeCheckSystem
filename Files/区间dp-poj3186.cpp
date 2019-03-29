#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <cstring>
#include <queue>
#include <algorithm>
#include <iostream>
#define LL long long
const int MAX_N = 2e3+10;
const double eps = 1e-8;
const LL mod = 1e9+7;
using namespace std;

LL q_pow(LL a,LL b){LL tmp; for(tmp = 1;b;b>>=1,a*=a) if(b&1) tmp*=a; return tmp;}

int a[MAX_N];
int dp[MAX_N][MAX_N];
int main()
{
    //freopen("in.txt","r",stdin);
    int N; memset(dp,0,sizeof(dp));
    scanf("%d",&N);
    for(int i = 1;i <= N;i++)
    {
        scanf("%d",&a[i]);
        dp[i][i] = a[i]*N;
    }
    for(int l = 1;l < N;l++)
    {
        for(int i = 1;i <= N-l;i++)
        {
            int j = i+l;
            //cout<<"i: "<<N-l<<endl;
            dp[i][j] = max(dp[i+1][j]+(N-l)*a[i],dp[i][j-1]+(N-l)*a[j]);
        }
    }
    printf("%d\n",dp[1][N]);
    return 0;
}
/*
*/
