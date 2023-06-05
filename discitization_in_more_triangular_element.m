clc
clear all
t=.5;
E=300e5;
mu=.25;
connectivity=[1,5,4;1,2,5;2,3,5;3,6,5;4,5,7;5,8,7;5,9,8;5,6,9];
x=[3 3 3 1.5 1.5 1.5 0 0 0];
y=[0 1 2 0 1 2 0 1 2];
D=[1 mu 0;
   mu 1 0;
   0 0 (1-mu)/2];
D=D*E/(1-mu^2);
ne=8;
nn=9;
dof=2;
K=zeros(dof*nn,dof*nn);
for i=1:ne
    n1=connectivity(i,1);
    n2=connectivity(i,2);
    n3=connectivity(i,3);
   x1=x(n1);
   y1=y(n1);
   x2=x(n2);
   y2=y(n2);
   x3=x(n3);
   y3=y(n3);
   B1=y2-y3;
   B2=y3-y1;
   B3=y1-y2;
   A1=x3-x2;
   A2=x1-x3;
   A3=x2-x1;
   Xp=[x1,x2,x3,x1]
   Yp=[y1,y2,y3,y1]
   axis([-1,5,-1,5])
   line(Xp,Yp)
   B=[B1 0 B2 0 B3 0;
      0 A1 0 A2 0 A3;
      A1 B1 A2 B2 A3 B3];
  m=[1 x1 y1;
     1 x2 y2;
     1 x3 y3];
 DE=det(m);
 B=B*1/DE;
 k=transpose(B)*D*B*(DE/2)*t;
n=[(2*n1-1),2*n1,(2*n2-1),2*n2, 2*n3-1, 2*n3];
    for i=1:6
        for j=1:6
        K(n(i),n(j))=K(n(i),n(j))+k(i,j);
        end
    end

end
disp(K);
bc=[1 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
f=[0;0;0;0;0;-1000;0;0;0;0;0;0;0;0;0;0;0;0];
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
d=inv(K)*f
for i=1:ne
    n1=connectivity(i,1);
    n2=connectivity(i,2);
    n3=connectivity(i,3);
   x1=x(n1) ;
   y1=y(n1);
   x2=x(n2);
   y2=y(n2);
   x3=x(n3);
   y3=y(n3);
   B1=y2-y3;
   B2=y3-y1;
   B3=y1-y2;
   A1=x3-x2;
   A2=x1-x3;
   A3=x2-x1;
   B=[B1 0 B2 0 B3 0;
      0 A1 0 A2 0 A3;
      A1 B1 A2 B2 A3 B3];
  m=[1 x1 y1;
     1 x2 y2;
     1 x3 y3];
 DE=det(m);
 B=B*1/DE;
 d1=d(2*n1-1);
 d2=d(2*n1);
 d3=d((2*n2)-1);
 d4=d(2*n2);
 d5=d(2*n3-1);
 d6=d(2*n3);
 de=[d1;d2;d3;d4;d5;d6]
 stress=D*B*de
end