%% Ecuaciones diferenciales
%Caída libre con rozamiento lineal
g=1;
gamma=1;
m=1;
num=100;
t=linspace(0,5,num)';
dt=t(2)-t(1);

v0=0;
v=zeros(num,1);
v(1)=v0;

for k=1:num-1
  v(k+1)=v(k)-(g+gamma/m*v(k))*dt;
end
plot(t,v)
hold all

vm=m*g/gamma*(exp(-gamma*t/m)-1);
plot(t,vm)

%% Caída libre con rozamiento cuadrático
g=1;
gamma=1;
m=1;
num=100000;
t=linspace(0,5,num)';
dt=t(2)-t(1);

v0=0;
v=zeros(num,1);
v(1)=v0;

for k=1:num-1
  v(k+1)=v(k)-(g-gamma/m*v(k)^2)*dt;
end
plot(t,v)
hold all

vm=m*g/gamma*(exp(-gamma*t/m)-1);
plot(t,vm)

%% De segundo grado (oscilador armónico con rozamiento)
num=1000000;
k=1;
gamma=0.2;
m=1;

u0=0;
x0=1;

t=linspace(0,20,num)';
dt=t(2)-t(1);
u=zeros(num,1);
x=zeros(num,1);
u(1)=u0;
x(1)=x0;

for i=1:num-1
  u(i+1)=u(i)+(-k/m*x(i)-gamma/m*u(i))*dt;
  x(i+1)=x(i)+u(i)*dt;
end

subplot(1,2,1)
plot(t,x)
hold all
subplot(1,2,2)
plot(t,u)
hold all

%% Oscilador armónico forzado con rozamiento

k=1;
gamma=0.2;
m=1;
A=1;
omega=1.2;
num=200000;

u0=0;
x0=1;

t=linspace(0,200,num)';
dt=t(2)-t(1);
u=zeros(num,1);
x=zeros(num,1);
u(1)=u0;
x(1)=x0;

for i=1:num-1
  u(i+1)=u(i)+(-k/m*x(i)-gamma/m*u(i))*dt+A/m*cos(omega*t(i))*dt;
  x(i+1)=x(i)+u(i)*dt;
end

subplot(1,2,1)
plot(t,x)
xlabel('t')
ylabel('x')
hold all
subplot(1,2,2)
plot(t,u)
xlabel('t')
ylabel('u')
hold all

