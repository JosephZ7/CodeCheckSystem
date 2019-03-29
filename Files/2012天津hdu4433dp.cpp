#include<cstdio>
#include<cstring>
#include<queue>
#include<map>
#include<stack>
#include<iostream>
#include<algorithm>
#define LL long long
using namespace std;
const int MAX_N = 1e3+10;
const int INF = 1<<30;
char s1[MAX_N],s2[MAX_N];
int dp[MAX_N][10][10];
int main()
{
    while(scanf("%s%s",s1,s2)!=EOF)
    {
        int len = strlen(s1);
        for(int i = 0;i <= len;i++)
            for(int j = 0;j < 10;j++)
                for(int k = 0;k < 10;k++)
                    dp[i][j][k] = INF;
        dp[0][0][0] = 0;
        for(int i = 0;i < len;i++)
        {
            for(int j = 0;j < 10;j++)
                for(int k = 0;k < 10;k++)
                {
                    int t = (s2[i]-s1[i]-j+20)%10;
                    for(int a = 0;a <= t;a++)
                        for(int b = 0;b <= a;b++)
                            dp[i+1][(k+a)%10][b] = min(dp[i+1][(k+a)%10][b],dp[i][j][k]+t);
                    t = (10-t)%10;
                    for(int a = 0;a <= t;a++)
                        for(int b = 0;b <= a;b++)
                            dp[i+1][(k-a+10)%10][(10-b)%10] = min(dp[i+1][(k-a+10)%10][(10-b)%10]
                                                                  ,dp[i][j][k]+t);
                }
        }
        printf("%d\n",dp[len][0][0]);
    }
    return 0;
}
