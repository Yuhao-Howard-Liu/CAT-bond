function [tt] = thetastar1(state)
% first  elements of theta i.e. lambda
tt= theta1(state)+gamma1(state)*sigma1(state)/g1(state);
end

