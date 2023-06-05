clc
clear all
E=30e5;
mu=0.25;
connectivity=[1,5,6,4;
              5,2,3,6];
  D=[1 mu 0;
   mu 1 0;
   0 0 (1-mu)/2;];
D=(D*E)/(1-mu^2);
ne=2;
nn=8;
dof=2;
K=zeros(nn*dof,nn*dof);
x=[0,30,30,0,15,15];
y=[0,0,10,15,0,12.5];
s=[-1,1,1,-1];
t=[-1,-1,1,1];
% N1=@(s,t) (1-s)*(1-t)*.25;
% N2=@(s,t) (1+s)*(1-t)*.25;
% N3=@(s,t) (1+s)*(1+t)*.25;
% N4=@(s,t) (1-s)*(1+t)*.25;
for i=1:ne
    n1=connectivity(i,1)
    n2=connectivity(i,2)
    n3=connectivity(i,3)
    n4=connectivity(i,4)
   x1=x(n1)
   y1=y(n1)
   x2=x(n2);
   y2=y(n2);
  
   x3=x(n3);
   y3=y(n3);
  
   x4=x(n4);
   y4=y(n4);

end
Ns1=@(t) -(1-t)/4;
Ns2=@(t) (1-t)/4;
Ns3=@(t) (1-t)/4;
Ns4=@(t) -(1-t)/4;
Nt1=@(s) -(1-s)/4;
Nt2=@(s) -(1-s)/4;
Nt3=@(s) (1-s)/4;
Nt4=@(s) (1-s)/4;
j11=x(1)*Ns1(0)+x(2)*Ns2(0)+x(3)*Ns3(0)+x(4)*Ns4(0);
j12=y(1)*Ns1(0)+y(2)*Ns2(0)+y(3)*Ns3(0)+y(4)*Ns4(0);
j21=x(1)*Nt1(0)+x(2)*Nt2(0)+x(3)*Nt3(0)+x(4)*Nt4(0);
j22=y(1)*Nt1(0)+y(2)*Nt2(0)+y(3)*Nt3(0)+y(4)*Nt4(0);
 J=[j11 j12;
    j21 j22];
U=inv(J)
Q=U*[Ns1(0);Nt1(0)]
W=U*[Ns2(0);Nt2(0)]
E=U*[Ns3(0);Nt3(0)]
R=U*[Ns4(0);Nt4(0)]
B=[Q(1) 0 W(1) 0 E(1) 0 R(1) 0;
    0 Q(2) 0 W(2) 0 E(2) 0 R(2);
    Q(2) Q(1) W(2) W(1) E(2) E(1) R(2) R(1)]
%    
%    A=[1 x1 y1 z1;
%        1 x2 y2 z2;
%        1 x3 y3 z3;
%        1 x4 y4 z4];
%    D1=det(A);
%    Q=inv(A);
%    for j=1:4
%    Alfa(j)=Q(1,j)*D1;
%    Beta(j)=Q(2,j)*D1;
%    Gama(j)=Q(3,j)*D1;
%    Delta(j)=Q(4,j)*D1;
%    end
%   B=[Beta(1) 0 0 Beta(2) 0 0 Beta(3) 0 0 Beta(4) 0 0; 
%      0 Gama(1) 0 0 Gama(2) 0 0 Gama(3) 0 0 Gama(4) 0;
%      0 0 Delta(1) 0 0 Delta(2) 0 0 Delta(3) 0 0 Delta(4);
%      Gama(1) Beta(1) 0 Gama(2) Beta(2) 0 Gama(3) Beta(3) 0 Gama(4) Beta(4) 0;
%      0 Gama(1) Delta(1) 0 Gama(2) Delta(2) 0 Gama(3) Delta(3) 0 Gama(4) Delta(4);
%      Delta(1) 0 Beta(1) Delta(2) 0 Beta(2) Delta(3) 0 Beta(3) Delta(4) 0 Beta(4)];
%   B=B/D1;
%   K=transpose(B)*D*B*D1/6
%     end