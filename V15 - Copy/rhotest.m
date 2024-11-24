p01=0.544854;
p10=1.494596;
e01=0.23312;
e10=1.02566;
Aind=[0 p01 e01 0;p10 0 0 e01;e10 0 0 p01;0 e10 p10 0];
AA=[0 -1 -1 1;-1 0 1 -1;-1 1 0 -1;1 -1 -1 0];
eta=[0 2.5 2 5;0.4 0 0.7 2;0.5 1.3 0 2.5;0.3 0.5 0.4 0];
aco=0;
acon=0;
bcon=0;
bco=0;
a=[aco acon bcon bco];
A=diag(a)*AA+Aind;
A_Q=A.*eta-diag(sum(A.*eta,2));
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
rho12=zeros(6,2);
rho34=zeros(6,2);
tic
for n= 1:6
rho=[-0.3+(n-1)*0.12 -0.3+(n-1)*0.12 0.9];

[price1,price2]= pricefun12(NN,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);
[price3,price4]= pricefun34(N,M,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);


rho12(n,:)=[price1;price2];
rho34(n,:)=[price3;price4];

end
toc

save rho0.mat rho12 rho34