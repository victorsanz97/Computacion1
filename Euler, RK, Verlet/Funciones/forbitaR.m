function  A = forbitaR(t,R)
% La aceleración solo depende de t,R pero no de U

% estructura de los argumentos de entrada y salida
%  R = (x1,y1,x2,y2,x3,y3)
%  A = (ax1,ay1,ax2,ay2,ax3,ay3)

np = length(R)/2;
x = zeros(1,np);
y = zeros(1,np);

x = R(1:2:end);
y = R(2:2:end);

r = sqrt(x.^2+y.^2);
r3 = 1./r.^3;

ax = -r3.*x;
ay = -r3.*y;

A = zeros(size(R));

A(1:2:end) = ax;
A(2:2:end) = ay;


end