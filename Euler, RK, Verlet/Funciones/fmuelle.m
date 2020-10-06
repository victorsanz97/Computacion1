function  A = fmuelle2d(t,R,U)
% estructura de los argumentos de entrada y salida
%  R = (x1,y1,x2,y2,x3,y3)
%  U = (u1,v1,u2,v2,u3,v3)
%  A = (ax1,ay1,ax2,ay2,ax3,ay3)

x = R(1:2:end);
y = R(2:2:end);
% las 2 siguientes no hacen falta
u = U(1:2:end);
v = U(2:2:end);

% muelle 2d amortiguado
r = sqrt(x.^2+y.^2);
ome0 = 1;
ome2 = ome0^2;
ax = -ome2*x;
ay = -ome2*y;


A = zeros(size(R));
A(1:2:end) = ax;
A(2:2:end) = ay;