clc
close all
clear all

% ejc.2
% 2A
% constante dieléctrica del vacío para introducir en la fórmula del
% potencial:
E0=8.85E-12;
K=1/(4*pi*E0);

% distancia del origen a los puntos en los que se mide potencial creado
% por las 4 cargas:
xa=-5.1E-2;
xb=-2.7E-2;
xc=3E-2;
xd=7E-2;

% distancia del origen a cada una de las 4 cargas:
x1=-4.3E-2;
x2=-1.5E-2;
x3=1.29E-2;
x4=4.7E-2;

% potencial en cada uno de los 4 puntos:
va=-1.3;
vb=3.33;
vc=-0.77;
vd=3;

% matrices que componen el sistema compatible determinado:
A=[K/abs(xa-x1) K/abs(xa-x2) K/abs(xa-x3) K/abs(xa-x4); 
    K/abs(xb-x1) K/abs(xb-x2) K/abs(xb-x3) K/abs(xb-x4); 
    K/abs(xc-x1) K/abs(xc-x2) K/abs(xc-x3) K/abs(xc-x4); 
    K/abs(xd-x1) K/abs(xd-x2) K/abs(xd-x3) K/abs(xd-x4)];
b=[va; vb; vc; vd];
% resolución del sistema compatible determinado con el comando mldivide:
%C=mldivide(A,b);
C=A\b;
Q=C'

% el valor de las cargas es:
q1=Q(1);
q2=Q(2);
q3=Q(3);
q4=Q(4);

%%
% 2B
N=100;
% región en la que se quiere representar el potencial:
lim=0.98E-2;
xmesh=linspace(-lim,lim,N);
ymesh=linspace(-lim,lim,N);
[x y]=meshgrid(xmesh,ymesh);
% potencial creado por las 4 cargas:
V=(K./((x.^2+y.^2)).^0.5)*(q1+q2+q3+q4);
% dibujar el potencial mediante el uso del comando mesh:
title('Potencial eléctrico')
mesh(x,y,V)





