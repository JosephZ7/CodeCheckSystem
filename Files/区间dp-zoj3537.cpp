
#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <queue>
#include <time.h>
#include <algorithm>
#include <iostream>
#define LL long long
#define INF 0x7fffffff
using namespace std;
const int MAX_N = 1e3+10;
const LL inf = 1e15+10;
const LL mod = 1e6+3;
const double eps = 1e-8;
int N,P;
struct Point
{
    double x,y;
    Point operator - (const Point &e1) const
    {
        Point t;
        t.x = x-e1.x;
        t.y = y-e1.y;
        return t;
    }
}p[MAX_N],ch[MAX_N];
int cost[MAX_N][MAX_N];
int dp[MAX_N][MAX_N];
int getcost(Point e1,Point e2)
{
    return abs((int)e1.x+(int)e2.x)*abs((int)e1.y+(int)e2.y)%P;
}
double calc(Point e1,Point e2)
{
    return e1.x*e2.y-e1.y*e2.x;
}
int len;
double multi(Point a,Point b,Point c)
{
    return (a.x-c.x)*(b.y-c.y)-(a.y-c.y)*(b.x-c.x);
}
double dis(Point a,Point b)
{
    return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y));
}
void graham_scan()
{
    int i,j,k,top;
    k=0;
    for(i=1; i < N; i++)
        if(p[i].y<p[k].y||(p[i].y==p[k].y&&(p[i].x<p[k].x)))
            k=i;
    swap(p[0],p[k]);
    for(i=1; i<N-1; i++)
    {
        k=i;
        for(j=i+1; j<N; j++)
            if(multi(p[j],p[k],p[0])>0||(fabs(multi(p[j],p[k],p[0]))<=eps&&
                    (dis(p[0],p[j])<dis(p[0],p[k]))))
                k=j;
        swap(p[i],p[k]);
    }
    ch[0]=p[0];
    ch[1]=p[1];
    ch[2]=p[2];
    top=2;
    for(i=3; i < N; i++)
    {
        while(multi(p[i],ch[top],ch[top-1])>0||fabs(multi(p[i],ch[top],ch[top-1]))<=eps)
            top--;
        ch[++top]=p[i];
    }
    len=top+1;
}
int main()
{
    while(scanf("%d%d",&N,&P)!=EOF)
    {
        for(int i = 0;i < N;i++)
            scanf("%lf%lf",&p[i].x,&p[i].y);
        graham_scan();
        if(len < N)
        {
            printf("I can't cut.\n");
            continue;
        }
        memset(cost,0,sizeof(cost));
        for(int i = 0;i < N;i++)
            for(int j = i+2;j < N;j++)
                cost[i][j] = cost[j][i] = getcost(ch[i],ch[j]);
        for(int i = 0;i < N;i++)
            for(int j = i;j < N;j++)
            {
                dp[i][j] = INF;
                dp[i][(i+1)%N] = 0;
            }
        for(int i = N-3;i >= 0;i--)
        {
            for(int j = i+2;j < N;j++)
            {
                for(int k = i+1;k < j;k++)
                    dp[i][j] = min(dp[i][j],dp[i][k]+dp[k][j]+cost[i][k]+cost[k][j]);
            }
        }
        printf("%d\n",dp[0][N-1]);
    }
    return 0;
}
