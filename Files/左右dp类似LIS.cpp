#include<stdio.h>
#include<map>
#include<vector>
#include<algorithm>
#include<string.h>
#include<queue>
#include<iostream>
#define LL long long
const int MAX_N = 5e3+10;
const LL mod = 1e9+7;
using namespace std;
int a[MAX_N],b[MAX_N];
bool cmp(int i,int j)
{
    return a[i] < a[j];
}
int dp[MAX_N][MAX_N];
int main()
{
    int n;
    while(scanf("%d",&n)!=EOF)
    {
        for(int i = 0;i < n;i++)
            scanf("%d",&a[i]);
        for(int i = 0;i < n;i++)
            b[i] = i;
        sort(b,b+n,cmp);
        memset(dp,0,sizeof(dp));
        for(int i = 0;i < n;i++)
        {
            int mid = b[i],Ma = 0;
            for(int j = mid-1;j >= 0;j--)
            {
                if(a[j] < a[mid])
                    Ma = max(Ma,dp[mid][j]);
                else if(a[j] > a[mid])
                    dp[j][mid] = Ma+1;
            }
            Ma = 0;
            for(int j = mid+1;j < n;j++)
            {
                if(a[j] < a[mid])
                    Ma = max(Ma,dp[mid][j]);
                else if(a[j] > a[mid])
                    dp[j][mid] = Ma+1;
            }
        }
        for(int i = 0;i < n;i++)
        {
            int ans = 0;
            for(int j = 0;j < n;j++)
                ans = max(ans,dp[i][j]);
            if(i == n-1)
                printf("%d\n",ans);
            else
                printf("%d ",ans);
        }
    }

    return 0;
}
