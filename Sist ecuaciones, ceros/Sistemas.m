%% Sistemas de ecuaciones
A=[3 5 1;1 0 1;-1 1 0];
y=[2;0;1];
x=inv(A)*y;
x1=A\y;
a=A*inv(A); %no sale I exactamente porque hay error en el cálculo
% el método no es útil para matrices con determinante casi cero

%% Kirchhoff
R=[10 0 0 0 0;-10 10 0 0 0;0 -10 3 0 0;0 0 -3 1 0;1 1 1 1 -1];
V=[5;0;0;0;0];
I=R\V;

%% Fuerza elástica
F=[5;50;500;1000;2000];
x=[0.001;0.011;0.13;0.30;0.75];
plot(x,F,'o')
hold all
X=[x x.^2];
k=X\F;
x1=linspace(0,1,1000);
F=k(1)*x1+k(2)*x1.^2;
plot(x1,F)

%% Potencial eléctrico

%posiciones de las cargas
xq=linspace(0,10,10);
yq=zeros(size(xq));

%posiciones de los potenciales
xV=xq;
yV=yq+0.2;

%matriz de distancias
%% con bucle
n=length(xq);
m=length(xV);
dd=zeros(n,m);
for i=1:n
    for j=1:m
        dd(j,i)=sqrt((xq(i)-xV(j))^2+(yq(i)-yV(j))^2);
    end
end
DD=1./dd;
V=ones(n,1);
q=DD\V;
plot(q)

%% sin bucle
dx=meshgrid(xq)-meshgrid(xV)';
dy=meshgrid(yq)-meshgrid(yV)';
dd=sqrt(dx.^2+dy.^2);
DD=1./dd;
V=ones(n,1);
q=DD\V;
plot(q)