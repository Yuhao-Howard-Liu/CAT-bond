syms a b a1 a2 b1 b2 t
AP=[-a,a;b,-b];
simplify(expm(AP))

AA=[-a1-b1,a1,b1,0;a2,-a2-b1,0,b1;b2,0,-b2-a1,a1;0,b2,a2,-a2-b2];
simplify(expm(t*AA))