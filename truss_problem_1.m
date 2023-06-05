clc
clear
K=zeros(8,8);
connectivity=[1 2;1 3;1 4];
X=[0 10 10 0];
Y=[0 0 10 10];
ne=3;
nn=4;
A=2;
E=300e5;
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
    for i=1:4
        for j=1:4
        K(n(i),n(j))=K(n(i),n(j))+k(i,j)
        end
    end
end
K;
bc=[1 1 0 0 0 0 0 0];
f=[0;-10000;0;0;0;0;0;0];
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
K

d=inv(K)*f;
disp(d)