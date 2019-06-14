import java.util.ArrayList;
import java.util.Scanner;

public class Fibonacci {
    public static void main(String args[]){

        Scanner s = new Scanner(System.in);
        System.out.println("请输入项数：");
        int n=s.nextInt();
        s.close();
        ArrayList<Integer> list=new ArrayList<>();
        for(int i=1;i<=n;i++){
            list.add(function(i));
        }
        System.out.println("斐波那契数列:");
        for(int i=0;i<n;i++){
             System.out.print(list.get(i)+" ");
        }
    }
    //递归
    public static int function(int n){
          if(n==1 || n==2)
              return 1;
          return function(n-1)+function(n-2);
    }
}