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
LL f[MAX_N];
void init()
{
    f[1] = 0;
    f[2] = 1;
    for(int i = 3;i <= 40;i++)
        f[i] = f[i-1]*2;
}
int main()
{
    int T;
    cin>>T;
    init();
    while(T--)
    {
        int M;
        scanf("%d",&M);
        printf("%lld\n",f[M]);
    }
    return 0;
}
/*
*/
