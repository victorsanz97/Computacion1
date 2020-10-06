function A = fpendpar(t,R,U,C)
% k = 100;
% m = 1;
% g = 1;
% l = 1;

x = R(1);
y = R(2);
u = U(1);
v = U(2);

r = sqrt(x.^2+y.^2);

ax = -C.k/C.m*(r-C.l)*(x/r);
ay = -C.g-C.k/C.m*(r-C.l)*(y/r)-1/(abs(y-C.yp))^15;

A = [ax ay];

end