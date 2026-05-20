rho=[0 0 0.9];
p01=1/15;
p10=2/3;
e01=1/8;
e10=3/2;
varsig1=0;
varsig2=0;
eta01=1.1;
eta10=0.9;
omega=1.5;

A_P=[-((1-varsig1)*p01+e01) (1-varsig1)*p01 e01-varsig1*p01 varsig1*p01;p10 -(p10+e01) 0 e01; e10 0 -(p01+e10) p01; varsig2*p10 e10-varsig2*p10 (1-varsig2)*p10 -((1-varsig2)*p10+e10)];
A=[-((1-varsig1)*p01*eta01+(e01-varsig1*p01)*eta01+varsig1*p01*eta01*omega) (1-varsig1)*p01*eta01 (e01-varsig1*p01)*eta01 varsig1*p01*eta01*omega;p10*eta10 -(p10*eta10+e01*eta01) 0 e01*eta01;e10*eta10 0 -(p01*eta01+e10*eta10) p01*eta01;0 (e10-varsig2*p10)*eta10 (1-varsig2)*p10*eta10 -((e10-varsig2*p10)*eta10+(1-varsig2)*p10*eta10)];

N=100000;
F=100;
y0=[0.1 0.04 0.05];
T=1;
initialstate=1;

[pricer,pricel]= pricefunrl(N,initialstate,T,y0,rho,F,A);

