%% Atracción gravitatoria Tierra-Sol

num=300000;
G=6.67e-11;
M=1.98e30;
L=1.5e11;
T=sqrt(L^3/G/M);
U=L/T;

xm=1.6e11;
ym=0;
um=0;
vm=2.9e4;

u0=um/U;
v0=vm/U;
x0=xm/L;
y0=ym/L;

t=linspace(0,10,num)';
dt=t(2)-t(1);
u=zeros(num,1);
v=zeros(num,1);
x=zeros(num,1);
y=zeros(num,1);
u(1)=u0;
v(1)=v0;
x(1)=x0;
y(1)=y0;

for k=1:num-1
    r=sqrt(x(k)^2+y(k)^2);
    R3=r^3;
    u(k+1)=u(k)-1/R3*x(k)*dt;
    v(k+1)=v(k)-1/R3*y(k)*dt;
    x(k+1)=x(k)+u(k)*dt;
    y(k+1)=y(k)+v(k)*dt;
end

modv=sqrt(u.^2+v.^2);

figure(1)
plot(x*L,y*L)
hold all
plot(0,0,'or')
xlabel('Posición x (m)')
ylabel('Posición y (m)')
axis equal
figure(2)
plot(t*T,x*L)
hold all
xlabel('Tiempo (s)')
ylabel('Posición x (m)')
figure(3)
plot(t*T,U*modv)
hold all
xlabel('Tiempo (s)')
ylabel('Velocidad total (m/s)')