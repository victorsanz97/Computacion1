function  A = fmuellelibre(t,R,U)
% estructura de los argumentos de entrada y salida
%  R = (x1,y1,x2,y2,x3,y3)
%  U = (u1,v1,u2,v2,u3,v3)
%  A = (ax1,ay1,ax2,ay2,ax3,ay3)

k = 1;
g = 10;
l = 2;
M1 = 1;
M2 = 0.7;

x1 = R(1);
% las 2 siguientes no hacen falta

% muelle 2d amortiguado
ax1 = k/M1*(x1-l)-g;
ax2 = -k/M2*(x1-l)+g;


A = [ax1 0 ax2 0];