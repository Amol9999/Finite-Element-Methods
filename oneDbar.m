clc
clear
K=zeros(3,3);
connect=[1 2;2 3];
a=[5,3];
l=[10,10];
E=30*10^6;
ne=2;                           %no of elements
nn=3;                           %no.of nodes
for i=1:ne
    a1=a(i);
    l1=l(i);
    s=a1*E/l1;
    k=[s -s;-s s];
    n1=connect(i,1)
    n2=connect(i,2)
    
    K(n1,n1)=K(n1,n1)+k(1,1);
    K(n1,n2)=K(n1,n2)+k(1,2);
    K(n2,n1)=K(n2,n1)+k(2,1);
    K(n2,n2)=K(n2,n2)+k(2,2);
end
K
f=[0;100;0];
bc=[0 1 1];
for i=1:nn
    if bc(i)==0
        for j=1:nn
        K(i,j)=0;
        K(j,i)=0;
        end
        K(i,i)=1;
        f(i)=0;
    end
    
end

d=inv(K)*f;
disp(d)