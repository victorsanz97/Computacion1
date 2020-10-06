%% Ejercicio

%Matriz 10x10 donde Mij=i+j si i+j par y Mij=0 si i+j impar

M=zeros(10);
for i=1:length(M)
    for j=1:length(M)
        mm=i+j;
        if mod(mm,2)==1
            M(i,j)=0;
        else
            M(i,j)=mm;
        end
    end
end
M(5,5)=0;

%% Gráficos 3d

t = 0:pi/50:10*pi;
r = 1;
x = r*sin(t);
y = r*cos(t);
figure
plot3(x,y,t)
grid on
axis square

%% Probabilidad 1d
%un viaje solo (hay que repetir el proceso)
num=100;
pp=2*randi(2,1,num)-3;
pos=cumsum(pp);
plot(pos)
hold all
xlabel('número de paso')
ylabel('posición')

%% n-viajes (con bucle)
num=100;
nviajes=10;
for k=1:nviajes
    pp=2*randi(2,1,num)-3;
    pos=cumsum(pp);
    plot(pos)
    hold all
end
xlabel('número de paso')
ylabel('posición')

%% n-viajes sin bucle
num=100;
nviajes=10;

pp=2*randi(2,nviajes,num)-3;
pos=cumsum(pp,2);

plot(pos')
hold all
xlabel('número de paso')
ylabel('posición')
figure
hist(pos(:,end))
%% n-viajes (teniendo en cuenta -1,0,1)
num=100;
nviajes=500;

pp=randi(3,nviajes,num)-2;
pos=cumsum(pp,2);

plot(pos')
hold all
xlabel('número de paso')
ylabel('posición')
figure
hist(pos(:,end))

%% Probabilidad 2d
num=100;
nviajes=40;

pp=2*randi(2,num,nviajes)-3;
x=cumsum(pp);
pp=2*randi(2,num,nviajes)-3;
y=cumsum(pp);

plot(x,y)
hold all
plot(x(end,1),y(end,1),'o')
xlabel('número de paso')
ylabel('posición')
axis equal
%% Probabilidad 3d
num=100;
nviajes=40;

pp=2*randi(2,num,nviajes)-3;
x=cumsum(pp);
pp=2*randi(2,num,nviajes)-3;
y=cumsum(pp);
pp=2*randi(2,num,nviajes)-3;
z=cumsum(pp);

%plot3(x(:,1),y(:,1),z(:,1))(un viaje/fila)
plot3(x,y,z)
hold all
plot3(x(end,:),y(end,:),z(end,:),'o')
xlabel('número de paso')
ylabel('posición')
axis equal

%% Probabilidad 3d (teniendo en cuenta -1,0,1)
num=100;
nviajes=40;

pp=randi(3,nviajes,num)-2;
x=cumsum(pp);
pp=randi(3,nviajes,num)-2;
y=cumsum(pp);
pp=randi(3,nviajes,num)-2;
z=cumsum(pp);

%plot3(x(:,1),y(:,1),z(:,1))(un viaje/fila)
plot3(x,y,z)
hold all
plot3(x(end,:),y(end,:),z(end,:),'o')
xlabel('número de paso')
ylabel('posición')
axis equal