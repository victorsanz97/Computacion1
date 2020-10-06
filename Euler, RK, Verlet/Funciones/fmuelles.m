function A = fmuelles(t,R,U)

K1 = 30;
K2 = 100;
M1 = 1;
M2 =.1;
g = 10;
L1 = 1;
L2 = 1;
gam1 = 0;
gam2 = 0;


x1 = R(1);
x2 = R(3);
u1 = U(1);
u2 = U(3);

ax1 = -K1/M1*(x1-L1) + K2/M1*(x2-x1-L2) + g - gam1/M1*u1;

ax2 = -K2/M2*(x2-x1-L2) + g - gam2/M2*u2;

A = [ax1  0 ax2 0];

end