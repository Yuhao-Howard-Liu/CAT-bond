p01=0.544854;
p10=1.494596;
e01=0.23312;
e10=1.02566;
Aind=[0 p01 e01 0;p10 0 0 e01;e10 0 0 p01;0 e10 p10 0];
AA=[0 -1 -1 1;-1 0 1 -1;-1 1 0 -1;1 -1 -1 0];
eta=[0 2.5 2 3;0.7 0 0.8 2;0.5 1.2 0 2.5;0.3 0.5 0.7 0];
aco=0.05;
acon=0;
bcon=0;
bco=0;
a=[aco acon bcon bco];
A=diag(a)*AA+Aind;
A_Q=A.*eta-diag(sum(A.*eta,2));
l_run=linsolve([A_Q';1 1 1 1],[0;0;0;0;1]);