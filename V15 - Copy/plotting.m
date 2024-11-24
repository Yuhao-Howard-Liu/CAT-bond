%aupup
plot(0:0.02:0.1,round(prices111,2),'+-')
hold on
plot(0:0.02:0.1,round(prices21,2),'+-')
plot(0:0.02:0.1,round(prices31,2),'+-')
grid on
xlabel('$a^{\uparrow\uparrow}$','Interpreter','Latex')
ylabel('Bond Price')
ylim([98.8 99.6])
xtickformat('%.2f')
ytickformat('%.2f')
ytickformat('usd')
legend('$b^{\uparrow\uparrow}=0$','$b^{\uparrow\uparrow}=0.05$','$b^{\uparrow\uparrow}=0.1$','Interpreter','Latex')
%bupup
plot(0:0.02:0.1,round(prices4,2),'+-')
hold on
plot(0:0.02:0.1,round(prices5,2),'+-')
plot(0:0.02:0.1,round(prices6,2),'+-')
grid on
xlabel('$b^{\uparrow\uparrow}$','Interpreter','Latex')
ylim([98.8 99.6])
ylabel('Bond Price')
xtickformat('%.2f')
ytickformat('%.2f')
ytickformat('usd')
%legend('$a^{\uparrow\uparrow}=0$','$a^{\uparrow\uparrow}=0.1$','Interpreter','Latex')
legend('$a^{\uparrow\uparrow}=0$','$a^{\uparrow\uparrow}=0.05$','$a^{\uparrow\uparrow}=0.1$','Interpreter','Latex')
%aupdown
plot(0:0.02:0.1,round(prices7,2),'+-')
%ylim([98.8 99.6])
hold on
plot(0:0.02:0.1,round(prices8,2),'+-')
plot(0:0.02:0.1,round(prices9,2),'+-')
grid on
xlabel('$a^{\uparrow\downarrow}$','Interpreter','Latex')
ylabel('Bond Price')
xtickformat('%.2f')
ytickformat('%.2f')
ytickformat('usd')
legend('$b^{\uparrow\downarrow}=0$','$b^{\uparrow\downarrow}=0.05$','$b^{\uparrow\downarrow}=0.1$','Interpreter','Latex')
%bupdown
plot(0:0.02:0.1,round(prices10,2),'+-')
hold on
plot(0:0.02:0.1,round(prices11,2),'+-')
plot(0:0.02:0.1,round(prices12,2),'+-')
ylim([99.4 100])
grid on
xlabel('$b^{\uparrow\downarrow}$','Interpreter','Latex')
ylabel('Bond Price')
xtickformat('%.2f')
ytickformat('%.2f')
ytickformat('usd')
legend('$a^{\uparrow\downarrow}=0$','$a^{\uparrow\downarrow}=0.05$','$a^{\uparrow\downarrow}=0.1$','Interpreter','Latex')


%change
price=round(sum(price12,2)+sum(price34,2),2);

%rho
rhoprice=sum(rho12,2)+sum(rho34,2);
plot(-0.3:0.12:0.3,round(rhoprice,2),'+-')
grid on
%hold on
%plot(-0.3:0.06:0.3,rho12price(1,2):-((rho12price(1,2)-rho12price(11,2))/10):rho12price(11,2),'--')
xlabel('\rho_{12}=\rho_{13}')
ylabel('Bond Price')
%legend('\rho_{13}=-0.3','\rho_{13}=0','\rho_{13}=0.3')
xtickformat('%.1f')
ytickformat('usd')

%rho12
rho12price=sum(rhoo12,3)+sum(rhoo34,3);
plot(-0.3:0.12:0.3,rho12price,'+-')
grid on
%hold on
%plot(-0.3:0.06:0.3,rho12price(1,2):-((rho12price(1,2)-rho12price(11,2))/10):rho12price(11,2),'--')
xlabel('\rho_{12}')
ylabel('Bond Price')
legend('\rho_{13}=-0.3','\rho_{13}=0','\rho_{13}=0.3')
xtickformat('%.1f')
ytickformat('usd')
%rho13
rho13price=sum(rhooo12,3)+sum(rhooo34,3);
plot(-0.3:0.12:0.3,rho13price,'+-')
grid on
hold on
%plot(-0.3:0.06:0.3,rho13price(2,1):-((rho13price(2,1)-rho13price(2,11))/10):rho13price(2,11),'--')
xlabel('\rho_{13}')
ylabel('Bond Price')
legend('\rho_{12}=-0.3','\rho_{12}=0','\rho_{12}=0.3')
xtickformat('%.1f')
ytickformat('usd')

%dp
dpprice=sum(dp12,1)+sum(dp34,1);
dpprice=[dpprice(1:2) dpprice(4:7)];
plot([0.51 0.53 0.55:0.02:0.61],round(dpprice,2),'+-')
hold on
%plot(0.544854,round(dpprice(3),2),'+r')
grid on
xlim([0.51 0.61])
%ylim([95.1 96.1])
xlabel('a^P_{0,1}')
ylabel('Bond Price')
xtickformat('%.2f')
ytickformat('%.2f')
xticks([0.51 0.53 0.55:0.02:0.61])
%xtickangle(45)
ytickformat('usd')
%de
deprice=sum(de12,1)+sum(de34,1);
deprice=[deprice(1:4) deprice(6:7)];
plot([0.08:0.04:0.2 0.24 0.28],round(deprice,2),'+-')
grid on
xlim([0.08 0.28])
ylim([98.4 100.2])
%ylim([94 98])
xlabel('a^E_{0,1}')
ylabel('Bond Price')
xticks([0.08:0.04:0.2 0.24 0.28])
xtickformat('%.2f')
%xtickangle(45)
ytickformat('usd')


%dp1
plot(0.51:0.02:0.61,round(dprice,2),'+-')
hold on
grid on
xlim([0.51 0.61])
%ylim([95.1 96.1])
xlabel('a^P_{0,1}')
ylabel('Bond Price')
xtickformat('%.2f')
ytickformat('%.2f')
xticks(0.51:0.02:0.61)
%xtickangle(45)
ytickformat('usd')
%de1
plot(0.08:0.04:0.28,round(deprice,2),'+-')
grid on
xlim([0.08 0.28])
ylim([98.8 100])
%ylim([94 98])
xlabel('a^E_{0,1}')
ylabel('Bond Price')
xticks([0.08:0.04:0.28])
xtickformat('%.2f')
%xtickangle(45)
ytickformat('usd')

%kappa
plot(2.5:0.2:3.5,sum(pricek12,2)+sum(pricek34,2),'+-')
grid on
%xlim([5 6])
%ylim([94 98])
xlabel('\kappa')
ylabel('Bond Price')
xticks(2.5:0.2:3.5)
xtickformat('%.1f')
ytickformat('usd')