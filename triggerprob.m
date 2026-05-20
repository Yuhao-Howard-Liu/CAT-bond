function [price1] = triggerprob(N,initialstate,T,y0,rho,Q,ptimes,etimes)

p1=zeros(1,N);
parfor n=1:N
[t,s]=ctmcgenerator(T,initialstate,Q);
p1(n)=defaultprobbase(T,t,s,y0,rho,ptimes,etimes);
end
price1=sum(p1)/N;
end