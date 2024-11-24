function [x] = price2base(T,t,s,y0,kappa,rho,F,c,ptimes,etimes)
%price2 given S;t is a vector for S relaization s is also a vector for
%realization; F is face value, c is fixed coupon, now delta;N is the number of
%the order is lambda r ell
    a=0;
    for n=2:T
        a=a+condexpect3(n,y0,t,s,[kappa 1 0],[kappa 1 -1],rho,ptimes,etimes);
    end
    b=0;
    for n=1:T
        b=b+condexpect1(n,y0,t,s,[kappa 1 0],rho,ptimes,etimes);
    end
    x=F*(condexpect1(1,y0,t,s,[kappa,1,-1],rho,ptimes,etimes)+a+(c-1)*b);
end