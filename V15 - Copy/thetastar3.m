function [tt] = thetastar3(state,rho)
% third  elements of theta i.e. ell rho is a 3-d vector rho12, rho13 rho23
tt= theta3(state)+sigma3(state)/g3(state)*(gamma1(state)*rho(2)+gamma2(state)*(rho(3)-rho(1)*rho(2))/sqrt(1-rho(1)^2)+gamma3(state)*sqrt((1-rho(1)^2-rho(2)^2-rho(3)^2+2*prod(rho))/(1-rho(1)^2)));
end