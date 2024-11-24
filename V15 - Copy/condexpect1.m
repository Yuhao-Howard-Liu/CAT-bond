function [cond] = condexpect1(T,y0,t,s,phi,rho,ptimes,etimes)
%eqution 5.6 (V110) given a realization of S, y0 is x in 5.6
y0=y0(:);
t=t(t<=T);
s=s(t<=T);
if size(t,2)==1
    cond=exp(Bfuct(0,T,phi,[0 0 0],s(1))'*y0+Cfuct(0,T,phi,[0 0 0],rho,s(1)));
else
    nn=size(t,2);%number of intervals
    B=h(s(nn-1),s(nn),ptimes,etimes)*Bfuct(t(nn),T,phi,[0 0 0],s(nn));
    Cs=zeros(1,nn);
    Cs(nn)=Cfuct(t(nn),T,phi,[0 0 0],rho,s(nn));
    for n=(nn-1):-1:2
        Cs(n)=Cfuct(t(n),t(n+1),phi,B,rho,s(n));
        B=h(s(n-1),s(n),ptimes,etimes)*Bfuct(t(n),t(n+1),phi,B,s(n));
    end
    Cs(1)=Cfuct(t(1),t(2),phi,B,rho,s(1));
    B=Bfuct(t(1),t(2),phi,B,s(1));
    cond=exp(B'*y0+sum(Cs));
end
