public class xixueguidigital_2 {

    public static void main(String[] args) {

        int a,b,c,d;
        int s[]=new int[4];
        boolean flag ;
        for(int i=1000;i<10000;i++){
        s[0]=i/1000;
        s[1]=i%1000/100;
        s[2]=i%100/10;
        s[3]=i%10;
        flag = false;
        /*有了这个就不会造成1260=21*60和1260=60*21两种输出了，
                    发现了1260，不会再继续查找abcd了*/
        if(s[2]==0&&s[3]==0){
            continue;
        }
        for(int j1=0;j1<s.length;j1++){
            a=s[j1];
            if(a!=0){
        for(int j2=0;j2<s.length;j2++){
        if(j2!=j1)  {
            b=s[j2];

        for(int j3=0;j3<s.length;j3++){
        if(j3!=j1&&j3!=j2)  
        {
            c=s[j3];
            if(c!=0)
            {
            for(int j4=0;j4<s.length;j4++){
            if(j4!=j1&&j4!=j2&&j4!=j3)  
             {
              d=s[j4];
              int sum=(a*10+b)*(c*10+d);    
              if(i==sum && flag == false)
                {
                flag = true;
                System.out.print(i+"=");
                System.out.println((a*10+b)+"*"+(c*10+d));
                    break;
                }

                    }
                   }

                 }
             }
       }
    }
   }
 }
 }

}

}
}