clc;
clear all;
K=zeros(6,6);
connect=[1 2;2 3];
I=1e-4;
l=[2,2];
E=70*10^9;
ne=2;                           %no of elements
nn=3;                           %no.of nodes
for i=1:ne
       L=l(i);
    k=[12 6*L -12 6*L;
       6*L 4*L^2 -6*L 2*L^2;
       -12 -6*L 12 -6*L;
       6*L 2*L^2 -6*L 4*L^2];
   k=k*E*I/L^3
   n1=connect(i,1)
    n2=connect(i,2)
    n=[2*n1-1 2*n1 2*n2-1 2*n2];
    for i=1:4
        for j=1:4
             K(n(i),n(j))=K(n(i),n(j))+k(i,j);
        end
    end
end
f=[-4000;0;0;0;0;0];
bc=[1 1 0 1 0 0];
for i=1:6
    if bc(i)==0
        for j=1:6
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