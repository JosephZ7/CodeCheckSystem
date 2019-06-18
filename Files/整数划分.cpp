#include <cstdio>
#include <cstring>
#define MAX(a,b) a>b?a:b
long long a[20][20];
long long dp[25][25];
int main()
{
    int T,m;
    scanf("%d",&T);
    getchar();
    while(T--)
    {
        char s[22];
        scanf("%s",s+1);
        scanf("%d",&m);
        int l=strlen(s),ok=1;
        memset(a,0,sizeof(a));
        for(int i=1;i<l;i++)
        {
            if(s[i]=='0')
                ok=0;
            for(int j=i;j<l;j++)
            {
                a[i][j]=a[i][j-1]*10+(s[j]-'0');
                printf("%d : %d %lld\n",i,j,a[i][j]);
            }
        }
        if(ok==0&&l-1==m||l-1<m)
        {
            printf("0\n");
            continue;
        }
        long long x,ans;
        memset(dp,0,sizeof(dp));
        for(int i=0;i<l;i++)
            dp[i][1]=a[1][i];
        for(int j=2;j<=m;j++)
        {
            for(int i=j;i<l;i++)
            {
                for(int k=1;k<i;k++)
                {
                    dp[i][j]=MAX(dp[i][j],dp[k][j-1]*a[k+1][i]);
                    printf("dp: %d--%d--%lld\n",i,j,dp[i][j]);
                }
            }
        }
        printf("%lld\n",dp[l-1][m]);
    }
    return 0;
}
