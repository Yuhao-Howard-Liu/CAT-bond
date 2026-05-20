function [tt] = thetastar2(state,rho)
% second  elements of theta i.e. r
%rho is a three-d vector rho12, rho13 rho23
tt= theta2(state)+sigma2(state)/g2(state)*(gamma1(state)*rho(1)+gamma2(state)*sqrt(1-rho(1)^2));
end