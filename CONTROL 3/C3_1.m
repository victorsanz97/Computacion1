clc
close all
clear all

% ejc. 1
% 1A
% posición y velocidad iniciales:
x0=2E-1;
v0=0.71;

% carga y masa de la partícula:
q=1E-6;
m=1E-2;

% parámetros:
D1=-2E+6;
D2=3E+7;
D3=-1E+8;

% intervalo de tiempo:
t0=0;
tmax=3;
N=1000;
dt=(tmax-t0)/N;

% ecuaciones diferenciales de primer orden que resultan de separar la
% ecuación diferencial de segundo orden (obtenida a parir de la segunda ley
% de Newton):
g1=@(xx,vv,tt) vv;
g2=@(xx,vv,tt) (q/m).*(D1.*xx+D2.*xx.^2+D3.*xx.^3);

% uso de la función anónima para resolver la ecuación diferencial:
[x,v,t]=RK2(g1,g2,t0,x0,v0,tmax,dt);

% La integral de la ecuación del movimiento es:
x
%%
% 1B
% Representar la posición de la partícula en función del tiempo:
figure(1)
hold on
plot(t,x,'b','linewidth',2)
title('Posición de la partícula')
xlabel('t[s]','fontsize',12)
ylabel('x(t)[m]','fontsize',12)
hold off

% Representar la velocidad de la partícula en función del tiempo:
figure(2)
hold on
plot(t,v,'r','linewidth',2)
title('Velocidad de la partícula')
xlabel('t[s]','fontsize',12)
ylabel('v(t)[m/s]','fontsize',12)
hold off

% Obtener la función aceleración a partir de la segunda ley de Newton:
a=(q/m).*(D1.*x+D2.*x.^2+D3.*x.^3)

% Representar la aceleración de la partícula en función del tiempo:
figure(3)
hold on
plot(t,a,'g','linewidth',2)
title('Aceleración de la partícula')
xlabel('t[s]','fontsize',12)
ylabel('a(t)[m/s^2]','fontsize',12)
hold off

%%
% 1C
% Energía cinética:
T=(1/2).*m.*v.^2;
% Energía potencial:
U=-q.*(D1.*(x.^2/2)+D2.*(x.^3/3)+D3.*(x.^4/4));
% Energía total:
E=T+U
% Dibujar las energías en función del tiempo:
figure(4)
hold on
plot(t,T,'g','linewidth',2)
plot(t,U,'r','linewidth',2)
plot(t,E,'b','linewidth',2)
title('Energía de la partícula')
legend('Energía cinética','Energía potencial','Energía total') 
xlabel('t[s]','fontsize',12)
ylabel('E(t)[J]','fontsize',12)
hold off

%%
% 1D
% como la partícula se mueve por efecto de una fuerza conservativa, el periodo se
% obtiene mediante una integral definida

% límites de integración:
a=0; b=3; N=100;
x=linspace(a,b,N);
% función a integrar:
f=1./(sqrt(E-U));
dx=(b-a)/(N-1);
% resolución de la integral por el método del trapecio con un bucle for:
I_tr=0;
for i=1:N-1
    I_tr=I_tr+((f(i)+f(i+1))/2)*dx;
end
% el periodo de oscilación será por lo tanto:
T=I_tr*sqrt(2*m)

% Los puntos de retorno de la partícula corresponden a puntos de velocidad
% nula. Por lo tanto, dichos puntos se calcularían averiguando "los ceros"
% de la función velocidad en el intervalo de tiempo [0,3]


