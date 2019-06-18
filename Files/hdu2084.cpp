#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <string>
#include <algorithm>
#include <vector>
#include <map>
#include <list>
#include <queue>
#include <set>
#include <stack>
#include <iostream>
#define PI 3.141592653589793
#define LL long long
#define MAX 0x3fffffff
#define INF 0x3f3f3f3f
#define mem(a,v) memset(a,v,sizeof(a))
const int MAX_N = 1e5+10;
const double eps = 1e-8;
const LL mod = 1000000009;
const LL inf = 1e15+5;
using namespace std;
int a[1005][1005],dp[1005][1005],N,ans;
int main()
{
    int T;
    cin>>T;
    while(T--)
    {
        ans = 0;
        scanf("%d",&N);
        for(int i = 1;i <= N;i++)
            for(int j = 1;j <= i;j++)
                scanf("%d",&a[i][j]);
        mem(dp,0);
        for(int i = N;i >= 1;i--)
            for(int j = 1;j <= i;j++)
                dp[i][j] = max(dp[i+1][j],dp[i+1][j+1])+a[i][j];
        cout<<dp[1][1]<<endl;
    }
    return 0;
}
/*
*/
