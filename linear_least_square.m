clc
clear
T=readtable('math11.xlsx','ReadVariableNames',true)
n=12;
X=T.Crop
Y=T.Year
plot(X,Y);hold on;
q=sum(X);
w=sum(Y);
m=X.*Y;
e=sum(m);
z=X.^2;
u=sum(z);
a=[n q;q u]
b=[w;e];
e=inv(a)*b;
A=e(1,:)
B=e(2,:)
F=@(X) A+B*X+1395.5
Ynew=F(X);
plot(X,Ynew)
y33=F(2019)
y2015=F(2015)
% a=input('enter the value of predicted year')
% l=a-X(n)
% for i=1:l
%     X(n+i)=X(n)+i;
%     Y(n+i)=F(X(n+i));
% end
% F(a)