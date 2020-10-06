%% Probabilidad 2d
num=200;
nviajes=1000;

pp=(randi(3,num,nviajes)-2)*2.55e-10;
x=cumsum(pp);
pp=(randi(3,num,nviajes)-2)*2.55e-10;
y=cumsum(pp);

plot(x,y)
hold all
plot(x(end,1),y(end,1),'o')
xlabel('x')
ylabel('y')
axis equal