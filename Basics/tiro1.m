% Tiro parabólico 
% P(t)=Po+Vot+(1/2)a*t^2
% a=(0,-g)
% plot(x,y)

n=100;
% dt=0.1;
tf=0.32;
dt=tf/n;
t=0:dt:0.32;       % t=tiempo
n_elem=length(t);
x=1*t;
y=1.5*t+(1/2)*(-9.8)*t.^2;
figure(3)
plot(x,y,'or')
title('Trayectoria')
xlabel('x(m)')
ylabel('y(m)')
grid on

%% 
% Vx Vy a partir de x e y

Vx=(x(2:end)-x(1:end-1))/dt;
Vy=(y(2:end)-y(1:end-1))/dt;
t1=t(1:end-1)+dt/2;
figure(4)
plot(t1,Vx,'or',t1,Vy,'ob')
xlabel('tiempo(s)')
ylabel('velocidad(m/s)')
legend('Vx','Vy')

%% 
%Energía Cinética
%Ec=(1/2)mv^2
%Ep=mgh
m=1; %1kg
moduloV=(Vx.^2+Vy.^2).^(1/2);
Ec=(1/2)*m*moduloV.^2;
y1=y(1:end-1);
Ep=m*(9.8)*y1;
Et=Ec+Ep;
figure(5)
plot(t1,Ec,'or',t1,Ep,'ob',t1,Et,'*k')
xlabel('Tiempo(s)')
ylabel('Julios(J)')
legend('Ec','Ep','Et')