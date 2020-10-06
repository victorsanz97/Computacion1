clc; clear all; 

%*************************************************%|
%                                                  |
%         Péndulo sostenido por un muelle          |
%                                                  |
%*************************************************%|

C.L0 = 0.1;
C.k = 10000;
C.g = 9.8;
C.m = 10;

%Cantidad de partículas (aproximada) con distintas velocidades iniciales, aquella que
%sea numVel/2 es aquella con la mínima para dar una vuelta completa
numVel =40;

% Elige qué partícula con una cierta velocidad inicial va a ser
% representada
partFav = 21;

fsys = @(t,r,u) fPenduloMuelle(t,r,u,C); % esta función tiene la definición del sistema

velTope = sqrt(4*C.g*C.L0); % Por definicion de la formula
velIni = (0.1:1/numVel:1)*velTope*2;
posIni = (1:1:length(velIni))*0 - C.L0;

U0 = zeros(length(velIni),2);
U0(:,1) = velIni';

R0 = zeros(length(velIni),2);
R0(:,2) = posIni';

t = [];

%% Runge-Kutta

dt = 1/1000;
numpinta = 300; % número de puntos que se guardan y pintan
numno = 5; % número de puntos calculados por cada punto pintado

countV = length(velIni); %Cantidad de particulas en juego

RXreal = zeros(numpinta,countV);
RYreal = zeros(numpinta,countV);

UXreal = zeros(numpinta,countV);
UYreal = zeros(numpinta,countV);
tTotal = zeros(1,numpinta*numno);

tTotal = (0:1/(numpinta):1)*dt*numpinta;
tTotal = tTotal(1,1:1:end-1);
for l=1:1:size(RXreal,2)
    
    t = zeros(1,numpinta);
    UU = zeros(numpinta,length(U0(l,:)));
    RR = UU;
    UU(1,:) = U0(l,:);
    RR(1,:) = R0(l,:);
    UUU = UU(1,:);
    RRR = RR(1,:);
    tt = 0;
    % El segundo bucle for sirve para limitar el num de puntos que se pintan

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
    x = RR(:,1:2:end);
    y = RR(:,2:2:end);
    
    u = UU(:,1:2:end);
    v = UU(:,2:2:end);
    RXreal(:,l) = x;
    RYreal(:,l) = y;
    UXreal(:,l) = u;
    UYreal(:,l) = v;
end

 
x = RXreal(:,partFav);
y = RYreal(:,partFav);

u = UXreal(:,partFav);
v = UYreal(:,partFav);

% ENERGIAS
 figure(100)
 Ek = 1/2*C.m*(u.^2 + v.^2);
 Ep = C.g * C.m * y;
 Et = Ep + Ek;
 
plot(t,Ek,'r',t, Ep,'b', t, Et,'k')
title('Energías')
xlabel('t (s)')
ylabel('E (J)')
legend('Ek','Ep','Et')

% POSICIONES VS T
figure(120)

subplot(2,1,1)
plot(t,x,'b')
title('X(t)')
xlabel('t (s)')
ylabel('x (m)')
legend('x')

subplot(2,1,2)
plot(t,y,'r')
title('Y(t)')
xlabel('t (s)')
ylabel('x (m)')
legend('y')

%TRAYECTORIA
figure(130)
plot(x,y,'r')
title('Trayectoria')
xlabel('X (m)')
ylabel('Y (m)')
axis equal

% Períodos

T = [];
for k = 1:1:(size(RXreal,2)-1)
    Ttemp = find(diff(RXreal(:,k)>0)==1);
    T(k) = (t(Ttemp(2)) - t(Ttemp(1)));
end

f = 1./T;

vel = zeros(1,length(T));
for k = 1:1:length(vel)
    vel(k) = (velIni(k+1)+ velIni(k))/2;
end

figure(140)
plot(vel,f,'k')
title('Períodos vs Velocidad')
xlabel('V (m/s)')
ylabel('f (s^(-1))')
axis equal