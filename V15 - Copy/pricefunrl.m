function [pricer,pricel] = pricefunrl(N,initialstate,T,y0,rho,F,Q,ptimes,etimes)

p1=zeros(1,N);
p2=zeros(1,N);
parfor n=1:N
[t,s]=ctmcgenerator(T,initialstate,Q);
p1(n)=rbondbase(T,t,s,y0,rho,F,ptimes,etimes);
p2(n)=lbondbase(T,t,s,y0,rho,F,ptimes,etimes);
end
pricer=sum(p1)/N;
pricel=sum(p2)/N;
end