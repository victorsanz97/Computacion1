%% Serie de Fourier (triangular)
% suma de senos y cosenos

L=1;
x=linspace(0,2*L,1000);
%y=zeros(size(x));
y=0;
figure(20)
for n=1:2:51
   y=y+(8/pi^2)*(-1)^((n-1)/2)/n^2*sin((n*pi*x)/L);
   plot(x,y)
   hold all
end
legend('1','3','5')
xlabel('x')
ylabel('y')
title('Onda triangular')

%% Integral de la onda triangular

yn=(y(1:end-1)+y(2:end))/2;
dx=diff(x);
area=dx.*yn;
xi=cumsum(area);
figure(2)
plot(x(2:end),xi)
hold all

%% Ajuste manual de la integral a una parábola

xp=linspace(0,0.5,100);
yp=xp.^2;
figure(2)
plot(xp,yp)

%% Derivada

dx=diff(x);
dy=diff(y);
xn=(x(1:end-1)+x(2:end))/2;
ds=dy./dx;
figure
plot(xn,ds)

%% Integral (del apartado Derivada)

areas=diff(xn).*(ds(1:end-1)+ds(2:end))/2;
xy=cumsum(areas);
figure
plot(xn(2:end),xy)

%% Sawtooth wave
L1=1;
x1=linspace(0,2*L1,1000);
%y=zeros(size(x));
y1=0;
for n1=1:11
   y1=y1-(1/pi)*((1/n1)*sin((n1*pi*x1)/L1));
   plot(x1,y1+0.5)
   hold all
end
