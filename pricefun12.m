function [price1,price2] = pricefun12(N,initialstate,T,y0,kappa,rho,F,c,Q,ptimes,etimes)

p1=zeros(1,N);
p2=zeros(1,N);
parfor n=1:N
[t,s]=ctmcgenerator(T,initialstate,Q);
p1(n)=price1base(T,t,s,y0,kappa,rho,F,ptimes,etimes);
p2(n)=price2base(T,t,s,y0,kappa,rho,F,c,ptimes,etimes);
end
price1=sum(p1)/N;
price2=sum(p2)/N;
end