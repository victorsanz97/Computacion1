clc
close all
clear all

% ejc. 1
% 1A
% posici�n y velocidad iniciales:
x0=2E-1;
v0=0.71;

% carga y masa de la part�cula:
q=1E-6;
m=1E-2;

% par�metros:
D1=-2E+6;
D2=3E+7;
D3=-1E+8;

% intervalo de tiempo:
t0=0;
tmax=3;
N=1000;
dt=(tmax-t0)/N;

% ecuaciones diferenciales de primer orden que resultan de separar la
% ecuaci�n diferencial de segundo orden (obtenida a parir de la segunda ley
% de Newton):
g1=@(xx,vv,tt) vv;
g2=@(xx,vv,tt) (q/m).*(D1.*xx+D2.*xx.^2+D3.*xx.^3);

% uso de la funci�n an�nima para resolver la ecuaci�n diferencial:
[x,v,t]=RK2(g1,g2,t0,x0,v0,tmax,dt);

% La integral de la ecuaci�n del movimiento es:
x
%%
% 1B
% Representar la posici�n de la part�cula en funci�n del tiempo:
figure(1)
hold on
plot(t,x,'b','linewidth',2)
title('Posici�n de la part�cula')
xlabel('t[s]','fontsize',12)
ylabel('x(t)[m]','fontsize',12)
hold off

% Representar la velocidad de la part�cula en funci�n del tiempo:
figure(2)
hold on
plot(t,v,'r','linewidth',2)
title('Velocidad de la part�cula')
xlabel('t[s]','fontsize',12)
ylabel('v(t)[m/s]','fontsize',12)
hold off

% Obtener la funci�n aceleraci�n a partir de la segunda ley de Newton:
a=(q/m).*(D1.*x+D2.*x.^2+D3.*x.^3)

% Representar la aceleraci�n de la part�cula en funci�n del tiempo:
figure(3)
hold on
plot(t,a,'g','linewidth',2)
title('Aceleraci�n de la part�cula')
xlabel('t[s]','fontsize',12)
ylabel('a(t)[m/s^2]','fontsize',12)
hold off

%%
% 1C
% Energ�a cin�tica:
T=(1/2).*m.*v.^2;
% Energ�a potencial:
U=-q.*(D1.*(x.^2/2)+D2.*(x.^3/3)+D3.*(x.^4/4));
% Energ�a total:
E=T+U
% Dibujar las energ�as en funci�n del tiempo:
figure(4)
hold on
plot(t,T,'g','linewidth',2)
plot(t,U,'r','linewidth',2)
plot(t,E,'b','linewidth',2)
title('Energ�a de la part�cula')
legend('Energ�a cin�tica','Energ�a potencial','Energ�a total') 
xlabel('t[s]','fontsize',12)
ylabel('E(t)[J]','fontsize',12)
hold off

%%
% 1D
% como la part�cula se mueve por efecto de una fuerza conservativa, el periodo se
% obtiene mediante una integral definida

% l�mites de integraci�n:
a=0; b=3; N=100;
x=linspace(a,b,N);
% funci�n a integrar:
f=1./(sqrt(E-U));
dx=(b-a)/(N-1);
% resoluci�n de la integral por el m�todo del trapecio con un bucle for:
I_tr=0;
for i=1:N-1
    I_tr=I_tr+((f(i)+f(i+1))/2)*dx;
end
% el periodo de oscilaci�n ser� por lo tanto:
T=I_tr*sqrt(2*m)

% Los puntos de retorno de la part�cula corresponden a puntos de velocidad
% nula. Por lo tanto, dichos puntos se calcular�an averiguando "los ceros"
% de la funci�n velocidad en el intervalo de tiempo [0,3]


