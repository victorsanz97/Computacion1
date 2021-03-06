%% Control3_2

close all
clear all
clc

%% Datos iniciales

numex = 5000; %n�mero de part�culas
N = 20; %n�mero de saltos

deltaE = 4.67e-21; %J
k = 1.38e-23; %J/K
T = 351; %K
xjump = 0.36; %nm %distancia de salto
xl = 2.88; %nm %l�mite

%Probabilidad
p1 = 0.5*exp(-deltaE/k/T);
p2 = 0.5*exp(-deltaE/k/T);
p3 = 1-p1-p2;

pp = cumsum([p1 p2 p3]);
ra = rand(N,numex);

x = (-((ra<=pp(1)) & (ra<pp(2))) + ((ra>pp(2)) & (ra<pp(3))))*xjump;

if x<=abs(xl)
    x = x;
elseif x>xl
    x = -(((ra<=pp(1)) & (ra<pp(2))))*xjump;
elseif x<-xl
    x = (((ra>pp(2)) & (ra<pp(3))))*xjump;
end
    
xx = cumsum(x);

plot(xx(end,:),'o')
title('Posici�n final a x=0 de part�culas con probabilidad aleatoria')
xlabel('N�mero de la part�cula')
ylabel('Posici�n final a x=0 [nm]')