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

int stk[10010];
int LIS(int a[],int n)
{
    int i,top,mid,low,high;
    top = 0;
    stk[0] = -1;
    for(i = 0;i < n;i++)
    {
        if(a[i] > stk[top])
            stk[++top] = a[i];
        else
        {
            low = 1;
            high = top;
            while(low <= high)
            {
                mid = (low+high)/2;
                if(a[i] > stk[mid])
                    low = mid+1;
                else
                    high = mid-1;
            }
            stk[low] = a[i];
        }
    }
    return top;
}
int a[MAX_N];
int main()
{
    int n;
    while(scanf("%d",&n)!=EOF)
    {
        for(int i = 0;i < n;i++)
        {
            scanf("%d",&a[i]);
        }
        printf("%d\n",LIS(a,n));
    }
    return 0;
}
/*
*/
