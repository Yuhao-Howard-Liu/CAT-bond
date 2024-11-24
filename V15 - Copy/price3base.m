function [x] = price3base(T,t,s,y0,kappa,rho,F,M,c,ptimes,etimes)
%price3 given S;t is a vector for S relaization s is also a vector for
%realization; F is face value, c is fixed coupon;M is the number of
%simulation for monte carlo integration,T needs to be greater than or equal
%to 1. the order is lambda r ell
    stime=rand(1,M);
    integdummy=zeros(1,M);
    for m=1:M
        integdummy(m)=condexpect2(stime(m),y0,t,s,[kappa 1 -1],rho,ptimes,etimes)+(c*stime(m)-1)*condexpect2(stime(m),y0,t,s,[kappa 1 0],rho,ptimes,etimes);
    end
    xxx=sum(integdummy)/M;
    
    integdummy2=zeros(length(2:T),M);
    for n=2:T
       stime=n+rand(1,M); 
       for m=1:M
           integdummy2(n,m)=condexpect4(stime(m),y0,t,s,[kappa 1 0],[kappa 1 -1],rho,ptimes,etimes)+(c*stime(m)+c*(-n+1)-1)*condexpect2(stime(m),y0,t,s,[kappa 1 0],rho,ptimes,etimes);
       end
    end
    xx=sum(sum(integdummy2,2)/M);
    x=F*kappa*(xx+xxx);
end