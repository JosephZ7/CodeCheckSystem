#include<cstdio>
#include<cstring>
#include<iostream>
#include<algorithm>
#define LL long long
using namespace std;
const int maxn = 1e5 + 10;
const int mod = 998244353;
int f[33][3];
void init()
{
    f[0][0] = f[1][1] = f[0][2] = 1;
    for(int i = 2;i <= 30;i++)
    {
        f[i][0] = f[i-2][0]+f[i-1][1]+f[i-2][2];
        f[i][1] = f[i-1][2];
        f[i][2] = f[i][0]+f[i-1][1];
    }
}
int main()
{
    int n;
    init();
    while(scanf("%d",&n)!=EOF)
    {
        if(n == -1) break;
        if(n&1)
            printf("0\n");
        else
            printf("%d\n",f[n][0]);
    }
    return 0;
}
