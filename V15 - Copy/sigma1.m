function [ss] = sigma1(state)
% first diagonal elements of Sigma
if state==1
    ss=0.01;
elseif state ==2
    ss=0.02;
elseif state ==3
    ss=0.01;
    elseif state ==4
        ss=0.02;
end