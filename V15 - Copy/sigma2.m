function [ss] = sigma2(state)
% second diagonal elements of Sigma
if state==1
    ss=0.002;
elseif state ==2
    ss=0.002;
elseif state ==3
    ss=0.004;
    elseif state ==4
        ss=0.004;
end