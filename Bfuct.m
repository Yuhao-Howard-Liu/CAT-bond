function [bb] = Bfuct(t,v,phi,x,state)
% function \mathbf{b} and x is alpha, the function is in lemma 5.1
bb=-[phi(1)/g1(state);phi(2)/g2(state);phi(3)/g3(state)]+[exp(-g1(state)*(v-t))*(x(1)+phi(1)/g1(state));exp(-g2(state)*(v-t))*(x(2)+phi(2)/g2(state));exp(-g3(state)*(v-t))*(x(3)+phi(3)/g3(state))];
end

