function [price3,price4] = pricefun34(N,M,initialstate,T,y0,kappa,rho,F,c,Q,ptimes,etimes)

p3=zeros(1,N);
p4=zeros(1,N);
parfor n=1:N
[t,s]=ctmcgenerator(T,initialstate,Q);
p3(n)=price3base(T,t,s,y0,kappa,rho,F,M,c,ptimes,etimes);
p4(n)=price4base(T,t,s,y0,kappa,rho,F,M,ptimes,etimes);
end
price3=sum(p3)/N;
price4=sum(p4)/N;
end