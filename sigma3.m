function [ss] = sigma3(state)
% third diagonal elements of Sigma
if state==1
    ss=0.0025;
elseif state ==2
    ss=0.0025;
elseif state ==3
    ss=0.005;
    elseif state ==4
        ss=0.005;
end