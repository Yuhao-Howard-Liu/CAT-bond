p01=0.544854;
p10=1.494596;
e01=0.23312;
e10=1.02566;
Aind=[0 p01 e01 0;p10 0 0 e01;e10 0 0 p01;0 e10 p10 0];
AA=[0 -1 -1 1;-1 0 1 -1;-1 1 0 -1;1 -1 -1 0];
eta=[0 2.5 2 5;0.4 0 0.7 2;0.5 1.3 0 2.5;0.3 0.5 0.4 0];
Y0=[0.02 0.05 0.055;0.045 0.05 0.055; 0.02 0.015 0.025;0.045 0.015 0.025];
NN=2000000;
N=25000;
M=2000;
T=3;
kappa=3;
c=0.13;
rho=[0 0 0.9];
ptimes=4;
etimes=3;
F=100;
prices5=zeros(6,1);
for m=1:6
aco=0.05;
acon=0;
bcon=0;
bco=0.02*(m-1);
a=[aco acon bcon bco];
A=diag(a)*AA+Aind;
A_Q=A.*eta-diag(sum(A.*eta,2));
l_run=linsolve([A_Q';1 1 1 1],[0;0;0;0;1]);
price12=zeros(4,2);
price34=zeros(4,2);
for n=1:4
initialstate=n;
y0=Y0(n,:);
[price1,price2]= pricefun12(NN,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);
[price3,price4]= pricefun34(N,M,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);
price12(n,:)=[price1,price2];
price34(n,:)=[price3,price4];
end
pricess=sum(price12,2)+sum(price34,2);
prices5(m)=l_run'*pricess;
end

save env5.mat prices5