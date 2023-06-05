clc
clear all
E=30e6;
mu=0.3;
connectivity=[1,2,3,4];
x=[1,0,0,2];
y=[1,0,2,1];
z=[2,0,0,0];
D=[1-mu mu mu 0 0 0;
   mu 1-mu mu 0 0 0;
   mu mu 1-mu 0 0 0;
   0 0 0 (1-2*mu)/2 0 0;
   0 0 0 0 (1-2*mu)/2 0
   0 0 0 0 0 (1-2*mu)/2];

D=(D*E)/((1-2*mu)*(1+mu));

ne=1;
nn=4;
dof=3;
K=zeros(nn*dof,nn*dof);

for i=1:ne
    n1=connectivity(i,1);
    n2=connectivity(i,2);
    n3=connectivity(i,3);
    n4=connectivity(i,4);
   x1=x(n1);
   y1=y(n1);
   z1=z(n1);
   x2=x(n2);
   y2=y(n2);
   z2=z(n2);
   x3=x(n3);
   y3=y(n3);
   z3=z(n3);
   x4=x(n4);
   y4=y(n4);
   z4=z(n4);
   A=[1 x1 y1 z1;
       1 x2 y2 z2;
       1 x3 y3 z3;
       1 x4 y4 z4];
   D1=det(A);
   Q=inv(A);
   for j=1:4
   Alfa(j)=Q(1,j)*D1;
   Beta(j)=Q(2,j)*D1;
   Gama(j)=Q(3,j)*D1;
   Delta(j)=Q(4,j)*D1;
   end
  B=[Beta(1) 0 0 Beta(2) 0 0 Beta(3) 0 0 Beta(4) 0 0; 
     0 Gama(1) 0 0 Gama(2) 0 0 Gama(3) 0 0 Gama(4) 0;
     0 0 Delta(1) 0 0 Delta(2) 0 0 Delta(3) 0 0 Delta(4);
     Gama(1) Beta(1) 0 Gama(2) Beta(2) 0 Gama(3) Beta(3) 0 Gama(4) Beta(4) 0;
     0 Gama(1) Delta(1) 0 Gama(2) Delta(2) 0 Gama(3) Delta(3) 0 Gama(4) Delta(4);
     Delta(1) 0 Beta(1) Delta(2) 0 Beta(2) Delta(3) 0 Beta(3) Delta(4) 0 Beta(4)];
  B=B/D1;
  K=transpose(B)*D*B*D1/6
    end
