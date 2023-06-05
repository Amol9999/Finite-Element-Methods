clc
clear
K=zeros(8,8);
connect=[1 2;2 3;3 4];
I=1e-4;
l=[6,6,3];
E=70*10^9;
ne=3;                           %no of elements
nn=4;                           %no.of nodes
for i=1:ne
       L=l(i);
    s=E*I/L^3;
    k=s*[12 6*L -12 6*L;
       6*L 4*L^2 -6*L 2*L^2;
       -12 -6*L 12 -6*L;
       6*L 2*L^2 -6*L 4*L^2];
    n1=connect(i,1)
    n2=connect(i,2)
    
    K(n1,n1)=K(n1,n1)+k(1,1);
    K(n1,n2)=K(n1,n2)+k(1,2);
    K(n2,n1)=K(n2,n1)+k(2,1);
    K(n2,n2)=K(n2,n2)+k(2,2);
    K(n1,n1)=K(n1,n1)+k(1,3);
    K(n1,n2)=K(n1,n2)+k(1,4);
    K(n2,n1)=K(n2,n1)+k(2,3);
    K(n2,n2)=K(n2,n2)+k(2,2);
    K(n1,n1)=K(n1,n1)+k(1,5);
    K(n1,n2)=K(n1,n2)+k(1,6);
    K(n2,n1)=K(n2,n1)+k(2,1);
    K(n2,n2)=K(n2,n2)+k(2,4);
end
f=[-1000;10000;500;0;0;0];
bc=[0 0 1 1 1 1 0 0];
for i=1:8
    if bc(i)==0
        for j=1:8
        K(i,j)=0;
        K(j,i)=0;
        end
        K(i,i)=1;
        f(i)=0;
    end
   
end
K
d=inv(K)*f;
disp(d)