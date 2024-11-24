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
N=10000;
M=5000;
T=3;
kappa=3;
c=0.13;
rho=[0 0 0.9];
ptimes=4;
etimes=3;
F=100;
rhooo12=zeros(3,6,2);
rhooo34=zeros(3,6,2);
tic
for n= 1:3
for m=1:6
rho=[-0.3+(n-1)*0.3 -0.3+(m-1)*0.12  0.9];
if (1-rho(1)^2-rho(2)^2-0.9^2+1.8*rho(1)*rho(2))>0
[price1,price2]= pricefun12(NN,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);
[price3,price4]= pricefun34(N,M,initialstate,T,y0,kappa,rho,F,c,A_Q,ptimes,etimes);

else
    price1=NaN; 
    price2=NaN;
    price3=NaN; 
    price4=NaN;    
end
rhooo12(n,m,:)=[price1;price2];
rhooo34(n,m,:)=[price3;price4];

end
end
toc

save rho2.mat rhooo12 rhooo34