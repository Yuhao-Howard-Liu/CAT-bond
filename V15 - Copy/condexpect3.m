function [cond] = condexpect3(T,y0,t,s,phi1,phi2,rho,ptimes,etimes)
%eqution 5.18 (V110) style given a realization of S
y0=y0(:);
t1=t(t<=(T-1));
s1=s(t<=(T-1));
t2=[(T-1) t(((T-1)<t)&(t<=T))];
s2=[s1(end) s(((T-1)<t)&(t<=T))];

if size(t1,2)==1
    if size(t2,2)==1
        C2=Cfuct(T-1,T,phi2,[0 0 0],rho,s2(1));
        B2=Bfuct(T-1,T,phi2,[0 0 0],s2(1));
        C1=Cfuct(0,T-1,phi1,B2,rho,s1(1));
        B1=Bfuct(0,T-1,phi1,B2,s1(1));
        cond=exp(C2)*exp(B1'*y0+C1);
    else
        nn2=size(t2,2);%number of intervals of t2
        B2=h(s2(nn2-1),s2(nn2),ptimes,etimes)*Bfuct(t2(nn2),T,phi2,[0 0 0],s2(nn2));
        C2s=zeros(1,nn2);
        C2s(nn2)=Cfuct(t2(nn2),T,phi2,[0 0 0],rho,s2(nn2));
        
        for n=(nn2-1):-1:2
        C2s(n)=Cfuct(t2(n),t2(n+1),phi2,B2,rho,s2(n));
        B2=h(s2(n-1),s2(n),ptimes,etimes)*Bfuct(t2(n),t2(n+1),phi2,B2,s2(n));
        end
        
        C2s(1)=Cfuct(t2(1),t2(2),phi2,B2,rho,s2(1));
        B2=Bfuct(t2(1),t2(2),phi2,B2,s2(1));
        
        C1=Cfuct(0,T-1,phi1,B2,rho,s1(1));
        B1=Bfuct(0,T-1,phi1,B2,s1(1));
        cond=exp(sum(C2s))*exp(B1'*y0+C1);
    end
else
    if size(t2,2)==1
        B2=Bfuct(T-1,T,phi2,[0 0 0],s2(1));
        C2=Cfuct(T-1,T,phi2,[0 0 0],rho,s2(1));
        nn1=size(t1,2);%number of intervals of t1
        B1=h(s1(nn1-1),s1(nn1),ptimes,etimes)*Bfuct(t1(nn1),T-1,phi1,B2,s1(nn1));
        C1s=zeros(1,nn1);
        C1s(nn1)=Cfuct(t1(nn1),T-1,phi1,B2,rho,s1(nn1));
        
        for n=(nn1-1):-1:2
        C1s(n)=Cfuct(t1(n),t1(n+1),phi1,B1,rho,s1(n));
        B1=h(s1(n-1),s1(n),ptimes,etimes)*Bfuct(t1(n),t1(n+1),phi1,B1,s1(n));
        end
        
        C1s(1)=Cfuct(t1(1),t1(2),phi1,B1,rho,s1(1));
        B1=Bfuct(t1(1),t1(2),phi1,B1,s1(1));
        cond=exp(C2)*exp(B1'*y0+sum(C1s));
    else
        nn2=size(t2,2);%number of intervals of t2
        B2=h(s2(nn2-1),s2(nn2),ptimes,etimes)*Bfuct(t2(nn2),T,phi2,[0 0 0],s2(nn2));
        C2s=zeros(1,nn2);
        C2s(nn2)=Cfuct(t2(nn2),T,phi2,[0 0 0],rho,s2(nn2));
        
        for n=(nn2-1):-1:2
        C2s(n)=Cfuct(t2(n),t2(n+1),phi2,B2,rho,s2(n));
        B2=h(s2(n-1),s2(n),ptimes,etimes)*Bfuct(t2(n),t2(n+1),phi2,B2,s2(n));
        end
        
        C2s(1)=Cfuct(t2(1),t2(2),phi2,B2,rho,s2(1));
        B2=Bfuct(t2(1),t2(2),phi2,B2,s2(1));
        
        nn1=size(t1,2);%number of intervals of t1
        B1=h(s1(nn1-1),s1(nn1),ptimes,etimes)*Bfuct(t1(nn1),T-1,phi1,B2,s1(nn1));
        C1s=zeros(1,nn1);
        C1s(nn1)=Cfuct(t1(nn1),T-1,phi1,B2,rho,s1(nn1));
        
        for n=(nn1-1):-1:2
        C1s(n)=Cfuct(t1(n),t1(n+1),phi1,B1,rho,s1(n));
        B1=h(s1(n-1),s1(n),ptimes,etimes)*Bfuct(t1(n),t1(n+1),phi1,B1,s1(n));
        end
        
        C1s(1)=Cfuct(t1(1),t1(2),phi1,B1,rho,s1(1));
        B1=Bfuct(t1(1),t1(2),phi1,B1,s1(1));
        
        cond=exp(sum(C2s))*exp(B1'*y0+sum(C1s));
    end
end

end


