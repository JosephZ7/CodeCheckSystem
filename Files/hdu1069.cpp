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

struct Point
{
    int x,y,z;
    bool operator < (const Point &e)const
    {
        if(x == e.x)
            return y > e.y;
        return x > e.x;
    }
}p[5000];
int dp[1000];
int main()
{
    int n,ti = 1;
    while(scanf("%d",&n)!=EOF)
    {
        if(n == 0) break;
        int k = 0,x,y,z;
        for(int i = 1;i <= n;i++)
        {
            scanf("%d%d%d",&x,&y,&z);
            p[k].x = x; p[k].y = y; p[k].z = z; k++;
            p[k].x = x; p[k].y = z; p[k].z = y; k++;
            p[k].x = y; p[k].y = x; p[k].z = z; k++;
            p[k].x = y; p[k].y = z; p[k].z = x; k++;
            p[k].x = z; p[k].y = x; p[k].z = y; k++;
            p[k].x = z; p[k].y = y; p[k].z = x; k++;
        }
        sort(p,p+k);
        int Ma = 0;
        for(int i = 1;i < k;i++)
        {
            dp[i] = p[i].z;
            for(int j = 0;j < i;j++)
            {
                if(p[j].x > p[i].x&&p[i].y < p[j].y)
                    dp[i] = max(dp[i],dp[j]+p[i].z);
            }
            if(dp[i] > Ma) Ma = dp[i];
        }
        printf("Case %d: maximum height = %d\n",ti++,Ma);
    }
    return 0;
}
/*
*/
