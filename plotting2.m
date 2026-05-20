rx=-0.5:0.1:0.5;
ry=-0.5:0.1:0.5;
[X,Y]=meshgrid(rx,ry);

rho34=zeros(11,11);
rho34(1,:)=sum(rho034,2);
rho34(2,:)=sum(rho134,2);
rho34(3,:)=sum(rho234,2);
rho34(4,:)=sum(rho334,2);
rho34(5,:)=sum(rho434,2);
rho34(6,:)=sum(rho534,2);
rho34(7,:)=sum(rho634,2);
rho34(8,:)=sum(rho734,2);
rho34(9,:)=sum(rho834,2);
rho34(10,:)=sum(rho934,2);
rho34(11,:)=sum(rho1034,2);
rho12=sum(rho12,3);
rho=rho12+rho34;



for n=[3,6,9]
plot(rx,rho(:,n),'+-')
hold on
    
    
    
    
end

grid on

xlabel("\rho_{1,2}")
ylabel("Bond Price")

legend('\rho_{1,3}=-0.3','\rho_{1,3}=0','\rho_{1,3}=0.3')
hold on 
plot(-0.3:0.1:0.5,1018.6:-10.0695:938.044,'*-')

for n=[3,6,9]
plot(rx,rho(n,:),'+-')
hold on
    
    
    
    
end

grid on

xlabel("\rho_{1,3}")
ylabel("Bond Price")

legend('\rho_{1,2}=-0.3','\rho_{1,2}=0','\rho_{1,2}=0.3')




surf(X,Y,rho12+rho34)
colorbar
ylabel("\rho_{1,2}")
xlabel("\rho_{1,3}")
zlabel("Bond Price")