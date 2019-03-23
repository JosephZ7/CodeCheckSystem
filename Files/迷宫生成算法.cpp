#include<cstdio>
#include<iostream>
#include<time.h>
#include<string.h>
#include<stdlib.h>
#include<vector>
#include<stack>
using namespace std;
const int n = 15;
const int m = 15;
int dir[4][2] = {{-2, 0}, {2, 0}, {0, 2}, {0, -2}};
int dir2[4][2] = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
vector<vector<int> > matrix(2*n+1, vector<int>(2*m+1));

struct Point
{
    int x,y;
};
void Random_area(Point &tmp)
{
    tmp.x = 2*(rand()%n)+1;
    tmp.y = 2*(rand()%m)+1;
}
bool checkRange(Point pt)
{
    if(pt.x < 0||pt.x >= 2*n+1||pt.y < 0||pt.y >= 2*m+1) return false;
    return true;
}
//检查区域是否被打通
bool check(Point pt)
{
    for(int i = 0;i < 4;i++)
    {
        Point now;
        now.x = pt.x+dir[i][0];
        now.y = pt.y+dir[i][1];
        if(!checkRange(now)) continue;
        int wx = (now.x+pt.x)/2;
        int wy = (now.y+pt.y)/2;
        if(matrix[wx][wy] == 0) return true;
    }
    return false;
}


//递归回溯算法
void Recursive()
{
    Point mp;
    Random_area(mp);
    stack<Point> stk;
    stk.push(mp);
    cout<<mp.x<<" "<<mp.y<<endl;
    while(!stk.empty())
    {
        Point now = stk.top();
        Point New[4];
        for(int i = 0 ;i < 4;i++)
        {
            New[i].x = now.x+dir[i][0];
            New[i].y = now.y+dir[i][1];
        }
        int cnt = 0;
        for(int i = 0;i < 4;i++)
        {
            if(!checkRange(New[i])) {cnt++; continue;}
            if(check(New[i])) cnt++;
        }
        if(cnt == 4) stk.pop();
        else
        {
            int ri = 0;
            do
            {
                ri = rand()%4;
                if(!check(New[ri])&&checkRange(New[ri]))
                    break;
            }while(1);
            int wx = (New[ri].x+now.x)/2;
            int wy = (New[ri].y+now.y)/2;
            matrix[wx][wy] = 0;
            stk.push(New[ri]);
        }
    }
}


//递归分割法
void Four_Cut(int lx,int ly,int rx,int ry)
{
    //cout<<lx<<" "<<ly<<endl;
    //cout<<rx<<" "<<ry<<endl;
    //cout<<endl;
    if(lx == rx)
    {
        for(int i = ly+1;i <= ry-1;i+=2)
            matrix[lx][i] = 0;
        return ;
    }
    else if(ly == ry)
    {
        for(int i = lx+1;i <= rx-1;i+=2)
            matrix[i][ly] = 0;
        return ;
    }
    int mlx,mly,mrx,mry;
    if(((lx+rx)/2)%2 == 0)
    {
        mlx = (lx+rx)/2-1;
        mrx = (lx+rx)/2+1;
    }
    else if(((lx+rx)/2)%2)
        mlx = mrx = (lx+rx)/2;

    if(((ly+ry)/2)%2 == 0)
    {
        mly = (ly+ry)/2-1;
        mry = (ly+ry)/2+1;
    }
    else if(((ly+ry)/2)%2)
        mly = mry = (ly+ry)/2;

    int up,left,right,down;
    //随机面
    up = rand()%(mlx-lx+1)+lx;
    matrix[up][mly+1] = 0;

    left = rand()%(mly-ly+1)+ly;
    matrix[mlx+1][left] = 0;

    right = rand()%(ry-mly+1)+mly;
    matrix[mlx+1][right] = 0;

    down = rand()%(rx-mlx+1)+mlx;
    matrix[down][mly+1] = 0;

    Four_Cut(lx,ly,mlx,mly);
    Four_Cut(lx,mry,mlx,ry);
    Four_Cut(mrx,ly,rx,mly);
    Four_Cut(mrx,mry,rx,ry);
}
void Recursive_Cut()
{
    Four_Cut(1,1,2*n-1,2*m-1);
}


//随机Prim算法
void Add_Wall(Point pt,vector<Point>& vList)
{
    for(int i = 0;i < 4;i++)
    {
        Point wl;
        wl.x = pt.x+dir2[i][0];
        wl.y = pt.y+dir2[i][1];
        if(wl.x > 0&&wl.x < 2*n&&wl.y > 0&&wl.y < 2*n&&matrix[wl.x][wl.y]!=0)
            vList.push_back(wl);
    }
}
void Random_Prim()
{
    Point start;
    Random_area(start);
    vector<Point> vList;
    //cout<<start.x<<" "<<start.y<<endl;
    Add_Wall(start,vList);
    //cout<<vList.size()<<endl;
    while(!vList.empty())
    {
        int x = rand()%vList.size();
        Point Wall = vList[x];
        Point Area_1,Area_2;
        if(matrix[Wall.x-1][Wall.y] == 0)
        {
            Area_1.x = Wall.x-1; Area_2.x = Wall.x+1;
            Area_1.y = Area_2.y = Wall.y;
        }
        else
        {
            Area_1.y = Wall.y-1; Area_2.y = Wall.y+1;
            Area_1.x = Area_2.x = Wall.x;
        }
        //cout<<Wall.x<<" "<<Wall.y<<endl;
        //cout<<Area_1.x<<" "<<Area_1.y<<endl;
        //cout<<Area_2.x<<" "<<Area_2.y<<endl;
        //cout<<endl;
        if(checkRange(Area_1)&&!check(Area_1)||checkRange(Area_2)&&!check(Area_2))
        {
            Add_Wall(Area_1,vList);
            Add_Wall(Area_2,vList);
            matrix[Wall.x][Wall.y] = 0;
        }
        swap(vList[x],vList[vList.size()-1]);
        vList.pop_back();
        //cout<<x<<" "<<vList.size()<<endl;
    }
}

//Kruskal+并查集
vector<int> fa;
void init()
{
    for(int i = 0;i < (2*n+1)*(2*m+1);i++)
        fa.push_back(i);
}
int Find(int x)
{
    return x == fa[x]?fa[x]:Find(fa[x]);
}
void Union(int x,int y)
{
    int fx = Find(x);
    int fy = Find(y);
    if(fx == fy) return ;
    fa[fy] = fx;
}
int ID(Point pt)
{
    return pt.x*(2*m+1)+pt.y;
}
void Kruskal()
{
    init();
    vector<Point> vList;
    for(int i = 0;i < 2*n+1;i++)
        for(int j = 0;j < 2*m+1;j++)
            if(matrix[i][j] == -1)
                vList.push_back(Point{i,j});

    while(!vList.empty())
    {
        int x = rand()%vList.size();
        Point Wall = vList[x];
        Point Area_1,Area_2;
        if(matrix[Wall.x-1][Wall.y] == 0)
        {
            Area_1.x = Wall.x-1; Area_2.x = Wall.x+1;
            Area_1.y = Area_2.y = Wall.y;
        }
        else if(matrix[Wall.x][Wall.y-1] == 0)
        {
            Area_1.y = Wall.y-1; Area_2.y = Wall.y+1;
            Area_1.x = Area_2.x = Wall.x;
        }
        else
        {
            swap(vList[x],vList[vList.size()-1]);
            vList.pop_back();
            continue;
        }

        if(!checkRange(Area_1)||!checkRange(Area_2))
        {
            swap(vList[x],vList[vList.size()-1]);
            vList.pop_back();
            continue;
        }

        int ida1 = ID(Area_1);
        int ida2 = ID(Area_2);
        if(Find(ida1) != Find(ida2))
        {
            Union(ida1,ida2);
            matrix[Wall.x][Wall.y] = 0;
        }

        swap(vList[x],vList[vList.size()-1]);
        vList.pop_back();
    }
}

void print()
{
    for (int i = 0; i < 2*n+1;i++)
    {
        for (int j = 0; j < 2*m+1;j++)
        {
            if(matrix[i][j]!=-1)
                printf("0 ");
            else
                printf("# ");
        }
        printf("\n");
    }
}
void Put_Wall()
{
    for (int i = 0; i < 2 * n + 1;i+=2)
        for (int j = 0; j < 2 * m + 1;j++)
            matrix[i][j] = -1;

    for(int i = 1;i < 2*n+1;i+=2)
        for(int j = 0;j < 2*m+1;j+=2)
            matrix[i][j] = -1;
}
int main()
{
    srand((unsigned)time(NULL));

    Put_Wall();

    //Recursive();
    //Recursive_Cut();
    //Random_Prim();
    Kruskal();
    print();
    return 0;
}
