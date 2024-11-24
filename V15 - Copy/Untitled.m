rho=[0.2 0.2 0.9];
thetastar3(1,rho)-thetastar2(1,rho)


Rho=zeros(11,11);
for m=1:11
    
for n=1:11
   x=-1+0.2*(n-1);
   y=-1+0.2*(m-1);
  Rho(m,n)=1-x^2-y^2-0.9^2+1.8*x*y;   
end
    
    
    
    
    
end