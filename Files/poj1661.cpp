#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <cstring>
#include <queue>
#include <algorithm>
#include <iostream>
#define LL long long
const int MAX_N = 1e3+10;
const double eps = 1e-8;
const LL mod = 1e9+7;
using namespace std;

LL q_pow(LL a,LL b){LL tmp; for(tmp = 1;b;b>>=1,a*=a) if(b&1) tmp*=a; return tmp;}

struct node
{
    int l,r,h;
    bool operator < (const node &e) const
    {
        if(h == e.h)
            return l < e.l;
        return h < e.h;
    }
}a[MAX_N];
int dp[MAX_N][2];
int main()
{
    //freopen("in.txt","r",stdin);
    int T;
    scanf("%d",&T);
    while(T--)
    {
        for(int i = 0;i < MAX_N;i++)
            dp[i][1] = dp[i][0] = 9e7;
        int N,X,Y,mh;
        scanf("%d%d%d%d",&N,&X,&Y,&mh);
        for(int i = 1;i <= N;i++)
        {
            scanf("%d%d%d",&a[i].l,&a[i].r,&a[i].h);
        }
        a[0].l = X,a[0].r = X,a[0].h = Y;
        a[N+1].l = -20001,a[N+1].r = 20001,a[N+1].h = 0;
        dp[0][0] = dp[0][1] = 0;
        sort(a,a+N+2);
        for(int i = 1;i <= N+1;i++)
        {
            int f1 = -1,f2 = -1;
            for(int j = i-1;j >=0&&a[i].h-a[j].h <= mh;j--)
            {
                if(f1 == 1&&f2 == 1) break;
                if(f1 == -1)
                {
                    if(j == 0)
                        dp[i][0] = a[i].h,f1 = 1;
                    else if(a[i].l <= a[j].r&&a[i].l >= a[j].l)
                        dp[i][0] = a[i].h-a[j].h+min(dp[j][0]+a[i].l-a[j].l,
                                                     dp[j][1]+a[j].r-a[i].l),f1 = 1;
                }
                if(f2 == -1)
                {
                    if(j == 0)
                        dp[i][1] = a[i].h,f2 = 1;
                    else if(a[i].r >= a[j].l&&a[i].r <= a[j].r)
                        dp[i][1] = a[i].h-a[j].h+min(dp[j][0]+a[i].r-a[j].l,
                                                     dp[j][1]+a[j].r-a[i].r),f2 = 1;
                }
            }
        }
        cout<<min(dp[N+1][0],dp[N+1][1])<<endl;
    }
    return 0;
}
/*
*/
