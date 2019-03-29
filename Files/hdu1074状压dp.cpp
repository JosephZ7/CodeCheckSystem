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

struct node
{
    char na[105];
    int d,c;
}h[200];
struct dnode
{
    int tim,sco,pre,now;
}dp[1<<16];
int main()
{
    int T;
    scanf("%d",&T);
    while(T--)
    {
        int N; memset(dp,0,sizeof(dp));
        scanf("%d",&N);
        for(int i = 0;i < N;i++)
        {
            scanf("%s%d%d",h[i].na,&h[i].d,&h[i].c);
        }
        int sta = 0;
        for(int i = 1;i < 1<<N;i++)
        {
            dp[i].sco = INF;
            for(int j = N-1;j >= 0;j--)
            {
                if(i&(1<<j))
                {
                    int sta = max(0,dp[i-(1<<j)].tim+h[j].c-h[j].d);
                    if(sta+dp[i-(1<<j)].sco < dp[i].sco)
                    {
                        dp[i].sco = sta+dp[i-(1<<j)].sco;
                        dp[i].now = j;
                        dp[i].pre = i-(1<<j);
                        dp[i].tim = dp[i-(1<<j)].tim+h[j].c;
                    }
                }
            }
        }
        int ed = (1<<N)-1;
        cout<<dp[ed].sco << endl;
        stack<int> s;
        while(ed)
        {
            s.push(dp[ed].now);
            ed = dp[ed].pre;
        }
        while(!s.empty())
        {
            cout<<h[s.top()].na<<endl;
            s.pop();
        }
    }
    return 0;
}
/*
*/
