function [bbb] = BBfuct(t,v,xx,state)
% function p in lemma 5.3, xx is beta
xx=xx(:);
bbb= [exp(-g1(state)*(v-t))*xx(1);exp(-g2(state)*(v-t))*xx(2);exp(-g3(state)*(v-t))*xx(3)];
end