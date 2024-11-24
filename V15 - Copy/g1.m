function [gg] = g1(state)
% first diagonal elements of G
if state==1
    gg=2;
elseif state ==2
    gg=1;
elseif state ==3
    gg=2;
    elseif state ==4
        gg=1;
end

