function [vv] = h(s1,s2,ptimes,etimes)
%The diagonal vector of h for different s1 and s2, ptimes is the
%multiples between good and bad states for lamabda (physical enviromemt), etimes is the
%multiples between good and bad states for risk free rate and reference rate (economic environment)
if s1==1 
    if s2==1
        vv=diag([1 1 1]);
    elseif s2==2
        vv=diag([ptimes 1 1]);
    elseif s2==3
        vv=diag([1 1/etimes 1/etimes]);
    elseif s2==4
        vv=diag([ptimes 1/etimes 1/etimes]);
    end
elseif s1==2
    if s2==1
        vv=diag([1/ptimes 1 1]);
    elseif s2==2
        vv=diag([1 1 1]);
    elseif s2==3
        vv=diag([1/ptimes 1/etimes 1/etimes]);
    elseif s2==4
        vv=diag([1 1/etimes 1/etimes]);
    end
elseif s1==3
    if s2==1
        vv=diag([1 etimes etimes]);
    elseif s2==2
        vv=diag([ptimes etimes etimes]);
    elseif s2==3
        vv=diag([1 1 1]);
    elseif s2==4
        vv=diag([ptimes 1 1]);
    end
elseif s1==4
    if s2==1
        vv=diag([1/ptimes etimes etimes]);
    elseif s2==2
        vv=diag([1 etimes etimes]);
    elseif s2==3
        vv=diag([1/ptimes 1 1]);
    elseif s2==4
        vv=diag([1 1 1]);
    end
end

