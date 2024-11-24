p01=0.544854;
p10=1.494596;
e01=0.23312;
e10=1.02566;
Aind=[0 p01 e01 0;p10 0 0 e01;e10 0 0 p01;0 e10 p10 0];
Aindd=[-(p01+e01) p01 e01 0;p10 -(p10+e01) 0 e01;e10 0 -(e10+p01) p01;0 e10 p10 -(e10+p10)];
AA=[0 -1 -1 1;-1 0 1 -1;-1 1 0 -1;1 -1 -1 0];
eta=[0 2.5 2 5;0.4 0 0.7 2;0.5 1.3 0 2.5;0.3 0.5 0.4 0];
Y0=[0.02 0.05 0.055;0.045 0.05 0.055; 0.02 0.015 0.025;0.045 0.015 0.025];
y0=[0.019 0.046 0.0495];
initialstate=1;
NN=20000;
N=5000;
M=2000;
T=3;
kappa=3;
c=0.13;
rho=[0 0 0.9];
ptimes=4;
etimes=3;
F=100;
%verifiy attach probability under P measure
attah_prob=1-triggerprob(NN,initialstate,1,y0,rho,Aindd,ptimes,etimes);

%difference between theta and thetastar
%thetastar1(1)-theta1(1);
%thetastar1(2)-theta1(2);
%thetastar2(1,rho)-theta2(1);
%thetastar2(3,rho)-theta2(3);
%thetastar3(1,rho)-theta3(1);
%thetastar3(3,rho)-theta3(3);
%verify interest rates
[pricer,pricel] = pricefunrl(NN,initialstate,1,y0,rho,F,Aindd,ptimes,etimes);
