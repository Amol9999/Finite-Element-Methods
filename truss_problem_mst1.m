clc
clear
K=zeros(6,6);
connectivity=[1 2;2 3];
X=[0 1 0];
Y=[0 0 1];
ne=2;
nn=3;
A=10^-4;
E=200e9;
dof=2;
for i=1:ne
    n1=connectivity(i,1);
    n2=connectivity(i,2);
    L=sqrt((X(n2)-X(n1))^2+(Y(n2)-Y(n1))^2);
    cos=(X(n2)-X(n1))/L;
    sin=(Y(n2)-Y(n1))/L;
    k=[cos^2 cos*sin -cos^2 -cos*sin;
        cos*sin sin^2 -cos*sin -sin^2;
        -cos^2 -cos*sin cos^2 cos*sin;
        -cos*sin -sin^2 cos*sin sin^2];
    k=k*A*E/L;
    n=[(2*n1-1),2*n1,(2*n2-1),2*n2];
    for i=1:3
        for j=1:3
        K(n(i),n(j))=K(n(i),n(j))+k(i,j)
        end
    end
end
K;
bc=[0 0 0 1 0 0];
f=[0;0;0;-12000;0;0];
for i=1:nn*dof
    if bc(i)==0
        for j=1:nn*dof
        K(i,j)=0;
        K(j,i)=0;
        end
        K(i,i)=1;
        f(i)=0;
    end
    
end
d=inv(K)*f;
disp(d)
K1=[-cos -sin cos sin];
s=E/L;
for i=1:2
    D=[d(i);d(i+1);d(i+2);d(i+3)];
   stress(i)=s*K1*D;
end
disp(stress)
