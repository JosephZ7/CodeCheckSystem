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
const int MAX_N = 1e4+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;

int S[MAX_N],D[MAX_N];
int dp[MAX_N][2];
struct time
{
    int h,m,s;
    void print()
    {
        if(h <= 12)
            printf("%02d:%02d:%02d am\n",h,m,s);
        else
            printf("%02d:%02d:%02d pm\n",h%12,m,s);
    }
};
void addtime(time &st,int f)
{
    st.h+=f/3600;
    f = f%3600;
    st.m+=f/60;
    f = f%60;
    st.s+=f;
}
int main()
{
    int N;
    scanf("%d",&N);
    while(N--)
    {
        int K;
        for(int i = 0;i < MAX_N;i++)
            for(int j = 0;j < 2;j++)
                dp[i][j] = INF;
        scanf("%d",&K);
        for(int i = 1;i <= K;i++)
            scanf("%d",&S[i]);
        for(int i = 2;i <= K;i++)
            scanf("%d",&D[i]);
        D[1] = S[1];
        dp[0][0] = 0; dp[0][1] = 0;
        for(int i = 1;i <= K;i++)
        {
            dp[i][0] = min(dp[i-1][0],dp[i-1][1])+S[i];
            if(i > 1)
                dp[i][1] = min(dp[i-2][0],dp[i-2][1])+D[i];
            else
                dp[i][1] = S[i];
        }
        int fen = min(dp[K][0],dp[K][1]);
       // cout<<fen<<endl;
        time st; st.h = 8; st.m = 0; st.s = 0;
        addtime(st,fen);
        st.print();
    }
    return 0;
}
/*
*/
