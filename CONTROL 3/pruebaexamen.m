close all
clear all
clc

%% Ej1

fsys = @fexamen; % esta funci?n tiene la definici?n del sistema
U0 = [0.71];
R0 = [2e-1];
t = [];

%% Runge Kutta

dt = 1/10000;
numpinta = 301; % n?mero de puntos que se guardan y pintan
numno = 100; % n?mero de puntos calculados por cada punto pintado

t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
AA = zeros(numpinta,1);

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
    AA(k,:) = K1u;  
    t(k+1) = tt; 
end


%% Plot de x,v,a en funcion de t

x = RR(:,1);
figure
plot([t; t]',x)

u = UU(:,1);
figure
plot([t; t]',u)

a= AA(:,1);
figure
plot([t; t]',a)


%% Energias

q=1e-6;
m=1e-2;
D1=-2e6;    %N/C*m
D2=3e7;    %N/C*m
D3=-1e8;    %N/C*m

T=0.5*m*u.^2;
figure
plot([t; t]',T)

U=-q*(D1/2*(x.^2)+D2/3*(x.^3)+D3/4*(x.^4));
figure
plot([t; t]',U)

E=T+U;
figure
plot([t; t]',E)


%% Ceros de v(t) (Puntos de retorno)

f=u;
[zeros]=saca0s (t,f);

