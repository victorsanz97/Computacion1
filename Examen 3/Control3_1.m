%% Control3_1

close all
clear all
clc

%%
fsys = @fpendulum; % esta funci?n tiene la definici?n del sistema

%Condiciones iniciales
U0 = 0;
R0 = 1.37; %rad
t = [];

%% Runge Kutta

dt = 1/10000; %diferencial de tiempo
numpinta = 800; % n?mero de puntos que se guardan y pintan
numno = 100; % n?mero de puntos calculados por cada punto pintado

t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
AA = UU;
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
    AA(k,:) = K1u;
    t(k+1) = tt; 
end

%% Plot phi vs t

phi = RR(:,1);
figure
plot([t; t]',phi)
title ('Posición angular en función del tiempo')
xlabel('Tiempo [s]')
ylabel('Posición angular [rad]')

%% Plot energy vs t

M = 0.13; %kg
g = 9.8; %m/s^2

u = UU(:,1);

figure

% Kinetic energy

K = 0.5*M*u.^2;
subplot(3,1,1)
plot([t; t]',K)
title ('Energía cinética en función del tiempo')
xlabel('Tiempo [s]')
ylabel('E_k [J]')

% Potential energy

h = cos(phi);
U = M*g*h;
subplot(3,1,2)
plot([t; t]',U)
title ('Energía potencial gravitatoria en función del tiempo')
xlabel('Tiempo [s]')
ylabel('E_p [J]')

% Total energy

E = K+U;
subplot(3,1,3)
plot([t; t]',E)
title ('Energía total en función del tiempo')
xlabel('Tiempo [s]')
ylabel('E_t [J]')

%Comentario
%E no constante al haber una fuerza dependiente de la velocidad (F no conservativa)