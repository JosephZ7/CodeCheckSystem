#include <bits/stdc++.h>
using namespace std;
int num[22];
int dnum[22];
long long dp[20][20][11][2][2][2][2];
int cal(long long x)
{
    int i=0;
    while(x>0)
    {
        num[i++]=x%10;
        x/=10;
    }
    return i;
}
long long  dfs(int pos, bool ismax, int len, int pre, bool up, bool down, bool ok, bool pz)
{
    if(!ok)return 0;
    long long ret=0;
    if(pos<0)
    {
        if(down && up && ok) return 1;
        else return 0;
    }

    if(!ismax && dp[pos][len][pre][up][down][ok][pz]>=0)
    {
        return dp[pos][len][pre][up][down][ok][pz];
    }
    int i, j;
    int bnd=ismax?num[pos]:9;
    for(i=0; i<=bnd; i++)
    {
        dnum[pos]=i;
        if(pz){ret+=dfs(pos-1, ismax && i==num[pos], len-(pz&&i==0), i, up, down, ok, pz&&i==0);continue;} //��Ȼ����ǰ����λ�������ݹ���len
        if(pre==i)
        {
            if(ok && pos<len/2) //��posС��len/2��ʱ��˵���������ĺ����ˣ���Ҫȥ�ж��Ƿ�������Ĵ�
            {
                ret+=dfs(pos-1, ismax && i==num[pos], len, i, up, down, ok&&dnum[len-pos-1]==i, pz);
            }
            else ret+=dfs(pos-1, ismax && i==num[pos], len, i, up, down, ok, pz);
        }
        else if(pre<i)
        {
            if(!down)continue;  //������������ڵݼ�����֮��

            if(ok && pos<len/2)
            {
                ret+=dfs(pos-1, ismax && i==num[pos], len, i, 1, down, ok&&dnum[len-pos-1]==i, pz);
            }
            else ret+=dfs(pos-1, ismax && i==num[pos], len, i, 1, down, ok, pz);
        }
        else if(pre>i)
        {
            if(up)continue;
            if(ok && pos<len/2)ret+=dfs(pos-1, ismax && i==num[pos], len, i, 0, 1, ok && dnum[len-pos-1]==i, pz);
            else ret+=dfs(pos-1,  ismax && i==num[pos], len, i, 0, 1, ok, pz);
        }
    }
    if(!ismax)return dp[pos][len][pre][up][down][ok][pz]=ret;
    else return ret;
}
int main()
{
    memset(dp, -1, sizeof dp);
    int t, i, j, x, y;
    long long  l, r, ll, rr;
    cin>>t;
    while(t--)
    {
        scanf("%lld%lld", &l, &r);
        int len=cal(l-1);
        ll=dfs(len-1, 1, len, 0, 0, 0, 1, 1);
        len=cal(r);
        rr=dfs(len-1, 1, len, 0, 0, 0, 1, 1);
        printf("%lld\n", rr-ll);
    }
}
