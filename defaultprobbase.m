function [x] = defaultprobbase(T,t,s,y0,rho,ptimes,etimes)
%
x=condexpect1(T,y0,t,s,[1 0 0],rho,ptimes,etimes);
end