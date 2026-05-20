function [tt] = theta1(state)
% first  elements of theta
if state==1
    tt=0.02;
elseif state ==2
    tt=0.045;
elseif state ==3
    tt=0.02;
    elseif state ==4
        tt=0.045;
end

