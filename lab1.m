clc
clear 
K=zeros(6,6);
con=[1 2;2 3];
for e=1:2
    SI=[875000 875000]
    for z=1:2
    le=2
    k=SI(z)*[12 6*le -12 6*le;6*le 4*le*le -6*le 2*le*le;-12 -6*le 12 -6*le;6*le 2*le*le -6*le 4*le*le]
    end
    n1=con(e,1)
    n2=con(e,2)
    n=[2*n1-1 2*n1 2*n2-1 2*n2]
    for i=1:4
        for j=4
            K(n(i),n(j))=K(n(i),n(j))+k(i,j)
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