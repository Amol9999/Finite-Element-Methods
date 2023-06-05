clc
clear
K=zeros(4,4);
s1=[2 1 2];
connect=[1 3;2 3;3 4];
n=3;
for i=1:n
    s=s1(i);
    k=[s -s;-s s];
    n1=connect(i,1);
    n2=connect(i,2);
    
    K(n1,n1)=K(n1,n1)+k(1,1);
    K(n1,n2)=K(n1,n2)+k(1,2);
    K(n2,n1)=K(n2,n1)+k(2,1);
    K(n2,n2)=K(n2,n2)+k(2,2);
end
K
f=[0;0;4;0];
bc=[0 0 1 1];
for i=1:4
    if bc(i)==0
        for j=1:4
        K(i,j)=0;
        K(j,i)=0;
        end
        K(i,i)=1;
        f(i)=0;
    end
    
    
end

d=inv(K)*f;
disp(d)