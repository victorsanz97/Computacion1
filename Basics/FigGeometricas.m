%% Triángulo
x=[0 1 0];
Y=[0 0 1];
figure(1)
plot(x,y)

%% Cuadrado
xx=[0 1 1 0];
yy=[0 0 1 1];
figure(2)
plot(xx,yy)

%% Pentágono
ang1=(0:5)*(360/5);
r1=1;
xxx=r1*cosd(ang1-270);
yyy=r1*sind(ang1-270);
figure(3)
plot(xxx,yyy)
axis equal

%% Hexágono
% cosd sind (en grados) cos sin (en radianes)
% Fórmula general (polígonos regulares) x=r*cosd(ang) y=r*sind(ang) r=radio
% ang=matriz(0:n)*(360/n) n=número lados
% ó x=r*cos(ang) y=r*sin(ang) r=radio ang=matriz(0:n)*(2*pi/n) n=lados
ang=(0:6)*60;
r=1;
x1=r*cosd(ang);
y1=r*sind(ang);
figure(4)
plot(x1,y1)
axis equal

%% Circunferencia
% Polígono de n-lados
n=100;
arg=(0:n)*(360/n);
r2=1;
x2=r2*cosd(arg);
y2=r2*sind(arg);
figure(5)
plot(x2,y2)
axis equal

%% Circunferencia-2
%Rotación de la circunferencia con un ángulo=dang
% %También se le puede aplicar un desplazamiento (en x4, y4 añadirle una
% cantidad a,b)
L=100;
l=1;
dang=30;
ang2=(0:L)*(360/L);
ANG=dang+ang2;
x4=l*cosd(ANG);
y4=l*sind(ANG);
figure(6)
plot(x4,y4)
axis equal

%% Elipse + elipse rotada
m=1;
m2=2;
k=100;
th=pi/2;
R2=[cos(th) -sin(th); sin(th) cos(th)];
ang0=(0:k)*(360/k);
x11=m*cosd(ang0);
y11=m2*sind(ang0);
figure(7)
plot(x11,y11)
hold all
XY2=[x11;y11];
XY2r=R2*XY2;
figure(7)
plot(XY2r(1,:),XY2r(2,:),'o')
axis equal

%% Rotación de puntos
th=pi/2;
R=[cos(th) -sin(th); sin(th) cos(th)];
x=[0 3 5];
y=[1 -1 0];
plot(x,y,'o')
xlim([-8,8])
ylim([-8,8])
s=R*[x(1);y(1)];
x(1)=s(1);
y(1)=s(2);
plot(x,y,'*')


%% Rotación de los tres puntos
th=pi/4;
R=[cos(th) -sin(th); sin(th) cos(th)];
x=[0 3 5];
y=[1 -1 0];
figure(12)
plot(x,y,'o')
hold all
xlim([-8,8])
ylim([-8,8])
XY=[x;y];
XYr=R*XY;
figure(12)
plot(XYr(1,:),XYr(2,:),'*')
axis equal

%% uso del bucle
m=1;
m2=2;
k=100;
ang0=(0:k)*(360/k);
x11=m*cosd(ang0);
y11=m2*sind(ang0);
for h=0:100
    th=h*pi/40;
    R2=[cos(th) -sin(th); sin(th) cos(th)];
    XY2r=R2*XY2;
    figure(100)
    plot(XY2r(1,:),XY2r(2,:),'k')
    axis equal
    xlim([-2,2])
    ylim([-2,2])
    drawnow
    pause(.1)
end