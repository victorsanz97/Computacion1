%% Varios astros

num=300000;
np=3;       %número de planetas
G=1;
M=1;
GM=G*M;

t=linspace(0,20,num)';
dt=t(2)-t(1);

%Planeta 1
u0=zeros(1,np);
v0=[1 0.6 0.3];
x0=[1 2 3];
y0=zeros(1,np);

u=zeros(num,np);
v=zeros(num,np);
x=zeros(num,np);
y=zeros(num,np);
u(1,:)=u0;
v(1,:)=v0;
x(1,:)=x0;
y(1,:)=y0;

for k=1:num-1
    for k1=1:np
    r=sqrt(x(k,k1)^2+y(k,k1)^2);
    R3=r^3;
    u(k+1,k1)=u(k,k1)-GM/R3*x(k,k1)*dt;
    v(k+1,k1)=v(k,k1)-GM/R3*y(k,k1)*dt;
    x(k+1,k1)=x(k,k1)+u(k,k1)*dt;
    y(k+1,k1)=y(k,k1)+v(k,k1)*dt;
    end
end

modv=sqrt(u.^2+v.^2);

figure(1)
plot(x,y)
hold all
plot(0,0,'or')
axis equal
% xlabel('Posición x')
% ylabel('Posición y')
% figure(2)
% plot(t,x)
% hold all
% xlabel('Tiempo')
% ylabel('Posición x')
% figure(3)
% plot(t,modv)
% hold all
% xlabel('Tiempo')
% ylabel('Velocidad total')