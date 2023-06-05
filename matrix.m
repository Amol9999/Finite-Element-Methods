clc
clear
n=20
k=1
for i=2:n
    flag=1
    for j=2:(i/2)
        if mod(i,j)~=0
            continue,
        else
            flag=0;
            break
        end
    end
    if flag==1
        arr(k)=i
        k=k+1;
    end
end
