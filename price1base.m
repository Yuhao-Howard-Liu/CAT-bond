function [x] = price1base(T,t,s,y0,kappa,rho,F,ptimes,etimes)
%price1 given S;t is a vector for S relaization s is also a vector for
%realization; F is face value, the order is lambda r ell
x=F*condexpect1(T,y0,t,s,[kappa 1 0],rho,ptimes,etimes);
end