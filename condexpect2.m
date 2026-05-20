function [cond] = condexpect2(T,y0,t,s,phi,rho,ptimes,etimes)
%eqution 5.12 style (V110) given a realization of S but only lambda in the front
y0=y0(:);
t=t(t<=T);
s=s(t<=T);
if size(t,2)==1
    cond=(BBfuct(0,T,[1 0 0],s(1))'*y0+CCfuct(0,T,phi,[0 0 0],[1 0 0],rho,s(1)))*exp(Bfuct(0,T,phi,[0 0 0],s(1))'*y0+Cfuct(0,T,phi,[0 0 0],rho,s(1)));
else
    nn=size(t,2);%number of intervals
    B=h(s(nn-1),s(nn),ptimes,etimes)*Bfuct(t(nn),T,phi,[0 0 0],s(nn));
    BB=h(s(nn-1),s(nn),ptimes,etimes)*BBfuct(t(nn),T,[1 0 0],s(nn));
    Cs=zeros(1,nn);
    Cs(nn)=Cfuct(t(nn),T,phi,[0 0 0],rho,s(nn));
    CCs=zeros(1,nn);
    CCs(nn)=CCfuct(t(nn),T,phi,[0 0 0],[1 0 0],rho,s(nn));
    for n=(nn-1):-1:2
        Cs(n)=Cfuct(t(n),t(n+1),phi,B,rho,s(n));
        CCs(n)=CCfuct(t(n),t(n+1),phi,B,(exp(Cs(n+1))*BB),rho,s(n));
        B=h(s(n-1),s(n),ptimes,etimes)*Bfuct(t(n),t(n+1),phi,B,s(n));
        BB=h(s(n-1),s(n),ptimes,etimes)*BBfuct(t(n),t(n+1),BB,s(n));
    end
    Cs(1)=Cfuct(t(1),t(2),phi,B,rho,s(1));
    CCs(1)=CCfuct(t(1),t(2),phi,B,(exp(Cs(2))*BB),rho,s(1));
    B=Bfuct(t(1),t(2),phi,B,s(1));
    BB=BBfuct(t(1),t(2),BB,s(1));
    cond=CCs*exp(B'*y0+cumsum(Cs))'+exp(B'*y0+Cs(1))*(BB'*y0);
end