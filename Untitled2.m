Rho=zeros(101,101);
for m=1:101
    
for n=1:101
   x=-1+0.02*(n-1);
   y=-1+0.02*(m-1);
  Rho(m,n)=1-x^2-y^2-0.9^2+1.8*x*y;   
end
    
    
    
    
    
end
Rho=zeros(6,6);
for m=1:6
    
for n=1:6
   x=-0.3+0.12*(n-1);
   y=-0.3+0.12*(m-1);
  Rho(m,n)=1-x^2-y^2-0.9^2+1.8*x*y;   
end
end



for m=1:101
    
for n=1:101
   if Rho(m,n)<0
      plot(-1+0.02*(n-1),-1+0.02*(m-1),'b.') 
      hold on
      
   else
        plot(-1+0.02*(n-1),-1+0.02*(m-1),'g.') 
        
        hold on
   end
end
    
    
    
    
    
end
xlabel('\rho_{1,2}')
ylabel('\rho_{1,3}')
