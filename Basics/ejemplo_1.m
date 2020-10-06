%Esto es un comentario

%Voy a hacer cuentas
%% una celda
clear all; close all

x=-1:0.01:1;
y=2*x.^2+7;
figure(111)
plot(x,y)

%%
x=-3:0.01:3;
y=sin(x)+sin(5*x);
figure(101)
plot(x,y)

%%
x=-3:0.01:3;
y=sin(x)+sin(5*x);
y1=sin(x)+sin(4*x);
figure(200)
plot(x,y,'or',x,y1,'*b')
xlabel('estiramiento (cm)')
ylabel('fuerza (N)')
title('Una comparación')
legend('con frecuencia 5','con frecuencia 4')