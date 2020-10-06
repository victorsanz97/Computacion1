function A=fpendulum(t,R,U)

L = 1.6; %m
H = 1.2; %m
M = 0.13; %kg
mu0 = 0.03; %kg/s
g = 9.8; %m/s^2
beta = (H*pi/2)/L;

x = R(1);
u = U(1);

if abs(x)<=beta
    alpha = -(g/L)*sin(x)-(mu0/M)*(u/L);
else
    alpha = -(g/L)*sin(x);
end

A = [alpha];

end