function [pp] = R(state)
% recovery rate
if state==1
    pp=0.4;
elseif state ==2
    pp=0.2;
elseif state ==3
    pp=0.36;
    elseif state ==4
        pp=0.18;
end