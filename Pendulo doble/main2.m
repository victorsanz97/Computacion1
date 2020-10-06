    clc; clear all; close all;
%*************************************************%|
%                                                  |
% Movimiento de 2 partículas unidas por un muelle  |
%                                                  |
%*************************************************%|


% Constante K(N/m):
C.k = 10000;

% Longitud del muelle en reposo
C.L0 = 0.2;

% Aceleración gravitatoria
C.g = 9.8;

% Masa
C.m = [0.1,0.2];


% Posiciones iniciales
R0 = [0 0,  C.L0 0];

% Velocidades iniciales
U0 = [5 20, 0 0];


fsys = @(t,r,u) dobleMuelle(t,r,u,C); % esta función tiene la definición del sistema

t = [];

%% Runge-Kutta

dt = 1/10000;
numpinta = 3000; % número de puntos que se guardan y pintan
numno = 5; % número de puntos calculados por cada punto pintado

t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;

for k=1:numpinta-1
    for k1=1:numno;
        K1x = UUU;
        K1u = fsys(tt,RRR,UUU);
        K2x = UUU + dt/2*K1u;
        K2u = fsys(tt+dt/2,RRR+dt/2*K1x,UUU+dt/2*K1u);
        K3x = UUU + dt/2*K2u;
        K3u = fsys(tt+dt/2,RRR+dt/2*K2x,UUU+dt/2*K2u);
        K4x = UUU + dt*K3u;
        K4u = fsys(tt+dt,RRR+dt*K3x,UUU+dt*K3u);

        tt = dt + tt;        
        RRR = RRR + dt/6*(K1x+2*K2x+2*K3x+K4x);
        UUU = UUU + dt/6*(K1u+2*K2u+2*K3u+K4u);

        end
        RR(k+1,:) = RRR;
        UU(k+1,:) = UUU;
        t(k+1) = tt; 
end
x1 = RR(:,1:4:end);
y1 = RR(:,2:4:end);
x2 = RR(:,3:4:end);
y2 = RR(:,4:4:end);

u1 = UU(:,1:4:end);
v1 = UU(:,2:4:end);
u2 = UU(:,3:4:end);
v2 = UU(:,4:4:end);

% TRAYECTORIA
xCM = (x1 * C.m(1) + x2 * C.m(2)) / (C.m(1) + C.m(2));
yCM = (y1 * C.m(1) + y2 * C.m(2)) / (C.m(1) + C.m(2));

figure(100)
plot(x1,y1,'r',x2,y2,'b',xCM,yCM,'g')
title('Trayectoria')
xlabel('X (m)')
ylabel('Y (m)')
legend('Partícula 1', 'Partícula 2', 'C.M.')
axis equal



% TRAYECTORIA RESPECTO AL CM
x1CM = x1 - xCM;
y1CM = y1 - yCM;

x2CM = x2 - xCM;
y2CM = y2 - yCM;

figure(110)
plot(x1CM,y1CM,'r',x2CM,y2CM,'b')
title('Trayectoria (centrado en C.M.)')
xlabel('X (m)')
ylabel('Y (m)')
legend('Partícula 1','Partícula 2')
axis equal

% Distancia vs tiempo
Xr12 = x2 - x1;
Yr12 = y2 - y1;

r12 = sqrt(Xr12.^2 + Yr12.^2);

figure(120)
plot(t,r12,'k')
title('Variación de distancia relativa entre partículas')
xlabel('Tiempo (t)')
ylabel('Distancia (m)')

% frecuencia
pos = find(diff((r12-C.L0)>0)==1);
T = 0;
for k = 1:1:length(pos)-1
    T = T + (t(pos(k+1))-t(pos(k)))/(length(pos)-1);
end

disp('Frecuencia de vibración:')
disp(T)
disp('')

% Alturas
disp('Máxima altura. Partícula 1: ')
disp(max(y1))

disp('')

disp('Máxima altura. Partícula 2: ')
disp(max(y2))
disp('')

disp('Máxima altura. Centro de Masa: ')
disp(max(yCM))

% ENERGÍAS
V1 = sqrt(u1.^2+v1.^2);
V2 = sqrt(u2.^2+v2.^2);

Ek1 = 1/2*C.m(1)*V1.^2;
Ek2 = 1/2*C.m(2)*V2.^2;

Ep1 = C.g*C.m(1)*y1;
Ep2 = C.g*C.m(2)*y2;

Et1 = Ek1 + Ep1;
Et2 = Ek2 + Ep2;

Ek = Ek1 + Ek2;
Ep = Ep1 + Ep2;
Et = Et1 + Et2;

figure(130)
% Particula1
subplot(3,1,1)
plot(t,Ek1,'r',t,Ep1,'b',t,Et1)
title('Energías [Particula 1]')
xlabel('t (s)')
ylabel('E (J)')
legend('Ek','Ep','Ek + Ep')

% Particula2
subplot(3,1,2)
plot(t,Ek2,'r',t,Ep2,'b',t,Et2)
title('Energías [Particula 2]')
xlabel('t (s)')
ylabel('E (J)')
legend('Ek','Ep','Ek + Ep')

% Total
subplot(3,1,3)
plot(t,Ek,'r',t,Ep,'b',t,Et)
title('Energías [Total]')
xlabel('t (s)')
ylabel('E (J)')
legend('Ek','Ep','Ek + Ep')