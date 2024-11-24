function [cond] = condexpect4(T,y0,t,s,phi1,phi2,rho,ptimes,etimes)
%eqution 5.34 (V110) style given a realization of S, T is v 
y0=y0(:);
t1=t(t<=floor(T));
s1=s(t<=floor(T));
t2=[floor(T) t((floor(T)<t)&(t<=T))];
s2=[s1(end) s((floor(T)<t)&(t<=T))];%assume change of state will not occur at the begining of each period.

if size(t1,2)==1
    if size(t2,2)==1
        B2=Bfuct(t2(1),T,phi2,[0 0 0],s2(1));
        C2=Cfuct(t2(1),T,phi2,[0 0 0],rho,s2(1));
        BB2=BBfuct(t2(1),T,[1 0 0],s2(1));
        CC2=CCfuct(t2(1),T,phi2,[0 0 0],[1 0 0],rho,s2(1));
        B1=Bfuct(t1(1),floor(T),phi1,B2,s1(1));
        C1=Cfuct(t1(1),floor(T),phi1,B2,rho,s1(1));
        BB1=BBfuct(t1(1),floor(T),BB2,s1(1));
        CC1=CCfuct(t1(1),floor(T),phi1,B2,BB2,rho,s1(1));
        cond=CC2*exp(C2)*exp(B1'*y0+C1)+exp(C2)*(CC1*exp(B1'*y0+C1)+exp(B1'*y0+C1)*(BB1'*y0));
    else
        nn2=size(t2,2);%number of intervals of t2
        B2=h(s2(nn2-1),s2(nn2),ptimes,etimes)*Bfuct(t2(nn2),T,phi2,[0 0 0],s2(nn2));
        C2s=zeros(1,nn2);
        C2s(nn2)=Cfuct(t2(nn2),T,phi2,[0 0 0],rho,s2(nn2));
        BB2=h(s2(nn2-1),s2(nn2),ptimes,etimes)*BBfuct(t2(nn2),T,[1 0 0],s2(nn2));
        CC2s=zeros(1,nn2);
        CC2s(nn2)=CCfuct(t2(nn2),T,phi2,[0 0 0],[1 0 0],rho,s2(nn2));
        
        for n=(nn2-1):-1:2
        C2s(n)=Cfuct(t2(n),t2(n+1),phi2,B2,rho,s2(n));
        CC2s(n)=CCfuct(t2(n),t2(n+1),phi2,B2,exp(C2s(n+1))*BB2,rho,s2(n));
        B2=h(s2(n-1),s2(n),ptimes,etimes)*Bfuct(t2(n),t2(n+1),phi2,B2,s2(n));
        BB2=h(s2(n-1),s2(n),ptimes,etimes)*BBfuct(t2(n),t2(n+1),BB2,s2(n));
        end
        
        C2s(1)=Cfuct(t2(1),t2(2),phi2,B2,rho,s2(1));
        CC2s(1)=CCfuct(t2(1),t2(2),phi2,B2,exp(C2s(2))*BB2,rho,s2(1));
        B2=Bfuct(t2(1),t2(2),phi2,B2,s2(1));
        BB2=BBfuct(t2(1),t2(2),BB2,s2(1));
        
        B1=Bfuct(t1(1),floor(T),phi1,B2,s1(1));
        C1=Cfuct(t1(1),floor(T),phi1,B2,rho,s1(1));
        BB1=BBfuct(t1(1),floor(T),BB2,s1(1));
        CC1=CCfuct(t1(1),floor(T),phi1,B2,BB2,rho,s1(1));
        
        cond=(CC2s*exp(cumsum(C2s')))*exp(B1'*y0+C1)+exp(C2s(1))*(CC1*exp(B1'*y0+C1)+exp(B1'*y0+C1)*(BB1'*y0));
    end
else
    if size(t2,2)==1
        B2=Bfuct(t2(1),T,phi2,[0 0 0],s2(1));
        C2=Cfuct(t2(1),T,phi2,[0 0 0],rho,s2(1));
        BB2=BBfuct(t2(1),T,[1 0 0],s2(1));
        CC2=CCfuct(t2(1),T,phi2,[0 0 0],[1 0 0],rho,s2(1));

        nn1=size(t1,2);%number of intervals of t1
        
        B1=h(s1(nn1-1),s1(nn1),ptimes,etimes)*Bfuct(t1(nn1),floor(T),phi1,B2,s1(nn1));
        C1s=zeros(1,nn1);
        C1s(nn1)=Cfuct(t1(nn1),floor(T),phi1,B2,rho,s1(nn1));
        BB1=h(s1(nn1-1),s1(nn1),ptimes,etimes)*BBfuct(t1(nn1),floor(T),BB2,s1(nn1));
        CC1s=zeros(1,nn1);
        CC1s(nn1)=CCfuct(t1(nn1),floor(T),phi1,B2,BB2,rho,s1(nn1));
     
        for n=(nn1-1):-1:2
        C1s(n)=Cfuct(t1(n),t1(n+1),phi1,B1,rho,s1(n));
        CC1s(n)=CCfuct(t1(n),t1(n+1),phi1,B1,exp(C1s(n+1))*BB1,rho,s1(n));
        B1=h(s1(n-1),s1(n),ptimes,etimes)*Bfuct(t1(n),t1(n+1),phi1,B1,s1(n));
        BB1=h(s1(n-1),s1(n),ptimes,etimes)*BBfuct(t1(n),t1(n+1),BB1,s1(n));
        end
        
        C1s(1)=Cfuct(t1(1),t1(2),phi1,B1,rho,s1(1));
        CC1s(1)=CCfuct(t1(1),t1(2),phi1,B1,exp(C1s(2))*BB1,rho,s1(1));
        B1=Bfuct(t1(1),t1(2),phi1,B1,s1(1));
        BB1=BBfuct(t1(1),t1(2),BB1,s1(1));
        cond=CC2*exp(C2)*exp(B1'*y0+sum(C1s))+exp(C2)*(CC1s*exp(B1'*y0+cumsum(C1s'))+exp(B1'*y0+C1s(1))*(BB1'*y0));
    else
        nn2=size(t2,2);%number of intervals of t2
        B2=h(s2(nn2-1),s2(nn2),ptimes,etimes)*Bfuct(t2(nn2),T,phi2,[0 0 0],s2(nn2));
        C2s=zeros(1,nn2);
        C2s(nn2)=Cfuct(t2(nn2),T,phi2,[0 0 0],rho,s2(nn2));
        BB2=h(s2(nn2-1),s2(nn2),ptimes,etimes)*BBfuct(t2(nn2),T,[1 0 0],s2(nn2));
        CC2s=zeros(1,nn2);
        CC2s(nn2)=CCfuct(t2(nn2),T,phi2,[0 0 0],[1 0 0],rho,s2(nn2));
        
        for n=(nn2-1):-1:2
        C2s(n)=Cfuct(t2(n),t2(n+1),phi2,B2,rho,s2(n));
        CC2s(n)=CCfuct(t2(n),t2(n+1),phi2,B2,exp(C2s(n+1))*BB2,rho,s2(n));
        B2=h(s2(n-1),s2(n),ptimes,etimes)*Bfuct(t2(n),t2(n+1),phi2,B2,s2(n));
        BB2=h(s2(n-1),s2(n),ptimes,etimes)*BBfuct(t2(n),t2(n+1),BB2,s2(n));
        end
        
        C2s(1)=Cfuct(t2(1),t2(2),phi2,B2,rho,s2(1));
        CC2s(1)=CCfuct(t2(1),t2(2),phi2,B2,exp(C2s(2))*BB2,rho,s2(1));
        B2=Bfuct(t2(1),t2(2),phi2,B2,s2(1));
        BB2=BBfuct(t2(1),t2(2),BB2,s2(1));
        
        nn1=size(t1,2);%number of intervals of t1
        B1=h(s1(nn1-1),s1(nn1),ptimes,etimes)*Bfuct(t1(nn1),floor(T),phi1,B2,s1(nn1));
        C1s=zeros(1,nn1);
        C1s(nn1)=Cfuct(t1(nn1),floor(T),phi1,B2,rho,s1(nn1));
        BB1=h(s1(nn1-1),s1(nn1),ptimes,etimes)*BBfuct(t1(nn1),floor(T),BB2,s1(nn1));
        CC1s=zeros(1,nn1);
        CC1s(nn1)=CCfuct(t1(nn1),floor(T),phi1,B2,BB2,rho,s1(nn1));     
        for n=(nn1-1):-1:2
        C1s(n)=Cfuct(t1(n),t1(n+1),phi1,B1,rho,s1(n));
        CC1s(n)=CCfuct(t1(n),t1(n+1),phi1,B1,exp(C1s(n+1))*BB1,rho,s1(n));
        B1=h(s1(n-1),s1(n),ptimes,etimes)*Bfuct(t1(n),t1(n+1),phi1,B1,s1(n));
        BB1=h(s1(n-1),s1(n),ptimes,etimes)*BBfuct(t1(n),t1(n+1),BB1,s1(n));
        end      
        C1s(1)=Cfuct(t1(1),t1(2),phi1,B1,rho,s1(1));
        CC1s(1)=CCfuct(t1(1),t1(2),phi1,B1,exp(C1s(2))*BB1,rho,s1(1));
        B1=Bfuct(t1(1),t1(2),phi1,B1,s1(1));
        BB1=BBfuct(t1(1),t1(2),BB1,s1(1));
        cond=CC2s*exp(cumsum(C2s'))*exp(B1'*y0+sum(C1s))+exp(C2s(1))*(CC1s*exp(cumsum(C1s'))*exp(B1'*y0)+exp(B1'*y0+C1s(1))*(BB1'*y0));
    end
end

