#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <string.h>
#include <string>
#include <cstring>
#include <algorithm>
#include <iostream>
#define LL long long
#define INF 0x7fffffff
#define PLL pair<LL,LL>
//#pragma comment(linker, "/STACK:1024000000,1024000000")
using namespace std;
const int MAX_N = 1e5+10;
const LL inf = 1e15+10;
const int mod = 1e9+7;

int s[20][20];
void init()
{
    for(int i = 1;i <= 10;i++)
        s[1][i] = s[i][1] = s[0][i] = 1;
    for(int i = 1;i <= 10;i++)
    {
        for(int j = 1;j <= 10;j++)
        {
            if(i >= j)
                s[i][j] = s[i][j-1]+s[i-j][j];
            else
                s[i][j] = s[i][j-1];
            //printf("i:%d j:%d v:%d\n",i,j,s[i][j]);
        }
    }
}
int main()
{
    int T; init();
    scanf("%d",&T);
    while(T--)
    {
        int m,n;
        scanf("%d%d",&m,&n);
        cout<<s[m][n]<<endl;
    }
    return 0;
}
/*
*/
