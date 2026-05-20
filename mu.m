function [muu] = mu(M,X)
%M is environment, X is for factors, a vector
muu=[g1(M)*(theta1(M)-X(1));g2(M)*(theta2(M)-X(2));g3(M)*(theta3(M)-X(3))];
end

