k=[ 1 0   -1     0    0    0;
    0 1    0     0    0   -1;
   -1 0   1.35 -.35 -.35 .35;
    0 0  -.35   .35  .35 -.35;
    0 0   -.35  .35  .35 -.35;
    0 -1  .35  -.35 -.35  1.35]


T=[.707 -.707 0 0 0 0;
    .707 .707 0 0 0 0;
    0 0 1 0 0 0;
    0 0 0 1 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1];
 l=.75   
p=2e8
K=p*T*k*transpose(T)
A=[0;0;0;-.143;0;0];
K*A

%;
