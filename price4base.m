function [x] = price4base(T,t,s,y0,kappa,rho,F,M,ptimes,etimes)
%price4 given S;t is a vector for S relaization s is also a vector for
%realization; F is face value;M is the number of
%simulation for monte carlo integration, the order is lambda r ell
    stime=T.*rand(1,M);
    integdummy=zeros(1,M);
    for m=1:M
        news=s(t<=stime(m));
        integdummy(m)=R(news(end))*condexpect2(stime(m),y0,t,s,[kappa 1 0],rho,ptimes,etimes);
    end
    x=T*F*kappa*sum(integdummy)/M;
end

