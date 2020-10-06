function  A = forbitaInt(t,R,U)
% estructura de los argumentos de entrada y salida
%  R = (x1,y1,x2,y2,x3,y3)
%  U = (u1,v1,u2,v2,u3,v3)
%  A = (ax1,ay1,ax2,ay2,ax3,ay3)
G = 1;
m = [1000e-6 1e-6 1e-6]; %masas relativas al Sol
x = R(1:2:end);
y = R(2:2:end);
% las 2 siguientes no hacen falta
u = U(1:2:end);
v = U(2:2:end);

% fuerza central (debida al sol inmovil en (0,0) )
r = sqrt(x.^2+y.^2);
r3 = 1./r.^3;
ax = -r3.*x;
ay = -r3.*y;

% fuerza de interacción entre los planetas
MM = m';
XX = repmat(x,length(x),1);
dX = XX'-XX;
YY = repmat(y,length(y),1);
dY = YY'-YY;
RR = sqrt(dX.^2 + dY.^2);
II = eye(length(RR));
R3 = 1./(RR+II).^3 - II;
R3x = (-G*R3.*dX)*MM;
R3y = (-G*R3.*dY)*MM;

axint = R3x';
ayint = R3y';

A = zeros(size(R));
A(1:2:end) = ax+axint;
A(2:2:end) = ay+ayint;