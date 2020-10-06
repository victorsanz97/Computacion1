%Derivada e integral numericas
%x en un oscilador amortiguado

t=linspace(0,100,1000);
A=1;
ome=1;
gam=.05;
x=A*cos(ome*t).*exp(-gam*t);
figure
plot(t,x)
ylabel('posición')
xlabel('tiempo')

%% derivada

dx=x(2:end)-x(1:end-1);
dt=t(2:end)-t(1:end-1);
v=dx./dt;
figure
plot(t(1:end-1),v)
hold all
plot(t(2:end),v)
tc=(t(2:end)+t(1:end-1))/2;
plot(tc,v)
%derivada analitica
vANA=A*exp(-gam*t).*((-gam)*cos(ome*t)-ome.*sin(ome*t));
plot(t,vANA,'.')

%% otro metodo

dt=diff(t);
dx=diff(x);
v=dx./dt;
tc=(t(2:end)+t(1:end-1))/2;
figure
plot(tc,v)

%% derivada segunda

dv=diff(v);
dt2=diff(tc);
a=dv./dt2;
tc2=t(2:end-1);
figure
plot(tc2,a)
%calcular ac analitica

%% integracion

plot(tc2,a)
areas=diff(tc2).*(a(1:end-1)+a(2:end))/2;
vi=cumsum(areas);
plot(tc2(2:end),vi-.15)
hold all
plot(tc,v,'.')
