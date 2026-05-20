p01=0.544854;
p10=1.494596;
e10=1.02566;
AA=[0 -1 -1 1;-1 0 1 -1;-1 1 0 -1;1 -1 -1 0];
eta=[0 2.5 2 5;0.4 0 0.7 2;0.5 1.3 0 2.5;0.3 0.5 0.4 0];
aco=0;
acon=0;
bcon=0;
bco=0;
a=[aco acon bcon bco];
y0=[0.019 0.046 0.0495];
initialstate=1;
NN=2000000;
N=20000;
M=5000;
T=3;
kappa=3;
c=0.13;
rho=[0 0 0.9];
ptimes=4;
etimes=3;
F=100;
e01value=[0.08:0.04:0.2 0.23312 0.24 0.28];
de12=zeros(2,7);
de34=zeros(2,7);
tic
for n= 1:7
e01=e01value(n);
Aind=[0 p01 e01 0;p10 0 0 e01;e10 0 0 p01;0 e10 p10 0];
A=diag(a)*AA+Aind;
A_Q=A.*eta-diag(sum(A.*eta,2));
[price1,price2]= pricefun12(NN,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);
de12(:,n)=[price1;price2];
[price3,price4]= pricefun34(N,M,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);
de34(:,n)=[price3;price4];
end
toc

save de.mat de12 de34