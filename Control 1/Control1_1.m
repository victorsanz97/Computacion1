%% Control 1_1

% Exercise 1.B

m = 1.4;
k = 6.5;
c = 0.8;
x0 = 2.8;
t = linspace(0,18,100);
omega0 = sqrt(k/m);
gamma = c/(2*m);
dseta = c/(2*sqrt(m*k));
phi = acos(sqrt(1-dseta^2));
x = x0./sqrt(1-dseta.^2).*exp(-gamma.*t).*cos(sqrt(1-dseta.^2).*omega0.*t-phi);
plot(t,x)
title('Posición de la masa')
xlabel('Tiempo (s))')
ylabel('Posición (m)')
legend('x(t)')
grid on

%Exercise 1.C

dt = diff(t);
dx = diff(x);
v = dx./dt;
tc = (t(1:end-1)+t(2:end))/2;
figure
plot(tc,v)
title('Velocidad de la masa')
xlabel('Tiempo(s)')
ylabel('Velocidad (m/s)')
legend('v(t)')
grid on

dt1 = diff(tc);
dv = diff(v);
a = dv./dt1;
tc2 = (tc(1:end-1)+tc(2:end))/2;
figure
plot(tc2,a)
title('Aceleración de la masa')
xlabel('Tiempo (s)')
ylabel('Aceleración (m/s^2)')
legend('a(t)')
grid on

%Exercise 1.D

areas = diff(tc).*(v(1:end-1)+v(2:end))/2;
Wroz = -c*(cumsum(areas));
figure
plot(tc(2:end),Wroz)
title('Fuerza de rozamiento')
xlabel('Tiempo (s)')
ylabel('Fuerza (N)')
legend('W_r_o_z(t)')
grid on

%Exercise 1.E

T = 1/2*m*v.^2;
U_elas = 1/2*k*x.^2;
E = T+U_elas(1:end-1);
figure
plot(tc,T)
hold all
plot(t,U_elas)
plot(tc,E)
title('Energías del sistema')
xlabel('Tiempo (s)')
ylabel('Energía (J)')
legend('T(t)','U_e_l_a_s(t)','E_t(t)')
grid on

%Al ser la energia suma de matrices de menor dimensión E0 parte de calcular
%el primer elemento de E, pero en función de tc

E0 = E(1);
Ee = E0+Wroz;
Ew = Ee(1:10:end);
tw = tc2(1:10:end);
figure
plot(tw,Ew,'o')
title('Energía inicial más rozamiento')
xlabel('Tiempo (s)')
ylabel('Energía (J)')
legend('E_0+W_r_o_z(t)')
grid on