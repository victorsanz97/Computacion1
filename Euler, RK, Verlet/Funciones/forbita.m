function  A = forbita(t,R,U)

% estructura de los argumentos de entrada y salida
%  R = (x1,y1,x2,y2,x3,y3)
%  U = (u1,v1,u2,v2,u3,v3)
%  A = (ax1,ay1,ax2,ay2,ax3,ay3)
np = length(R)/2;
x = zeros(1,np);
y = zeros(1,np);
% for k = 0:np-1
%     x(1+k) = R(1+2*k);
%     y(1+k) = R(2+2*k);
%     u(1+k) = U(1+2*k);
%     v(1+k) = U(2+2*k); 
% end

x = R(1:2:end);
y = R(2:2:end);
% las 2 siguientes no hacen falta
u = U(1:2:end);
v = U(2:2:end);

r = sqrt(x.^2+y.^2);
r3 = 1./r.^3;

ax = -r3.*x;
ay = -r3.*y;

A = zeros(size(R));

% for k = 0:np-1
%     A(1+2*k) = ax(1+k);
%     A(2+2*k) = ay(1+k);
% end
A(1:2:end) = ax;
A(2:2:end) = ay;


end