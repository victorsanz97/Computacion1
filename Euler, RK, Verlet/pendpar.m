C.k = 1;
C.m = 1;
C.g = 1;
C.l = 1;
C.yp = 0;

%fsys = @fpend; % esta función tiene la definición del sistema
fsys = @(t,r,u) fpendpar(t,r,u,C);
U0 = [2 0];
R0 = [0 -1];
t = [];

%% Runge-Kutta

dt = 0.004;
numpinta = 1000; % número de puntos que se guardan y pintan
numno = 15; % número de puntos calculados por cada punto pintado

t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;
figure(100)
hs = plot(0,0,'o');
set(hs,'markerfacecolor','r');
    axis equal
    hold on
hp = plot(R0(1),R0(2),'o');
set(hp(1),'markerfacecolor','b');
xlim([-10 10])
ylim([-10 10])
for k=1:numpinta-1
    for k1=1:numno;
        K1x = UUU;
        K1u = fsys(tt,RRR,UUU);
        K2x = UUU + dt/2*K1u;
        K2u = fsys(tt+dt/2,RRR+dt/2*K1x,UUU+dt/2*K1u);
        K3x = UUU + dt/2*K2u;
        K3u = fsys(tt+dt/2,RRR+dt/2*K2x,UUU+dt/2*K2u);
        K4x = UUU + dt*K3u;
        K4u = fsys(tt+dt,RRR+dt*K3x,UUU+dt*K3u);
        
        tt = dt + tt;
        RRR = RRR + dt/6*(K1x+2*K2x+2*K3x+K4x);
        UUU = UUU + dt/6*(K1u+2*K2u+2*K3u+K4u);
    end
    RR(k+1,:) = RRR;
    UU(k+1,:) = UUU;
    t(k+1) = tt; 
     %% animacion
    set(hp(1),'xdata',RRR(1),'ydata',RRR(2))
    drawnow
    
    %%
    
end
x = RR(:,1:2:end);
y = RR(:,2:2:end);
figure(120)
subplot(3,1,1)
plot(t,x)
axis equal
subplot(3,1,2)
plot(t,y)
axis equal
subplot(3,1,3)
plot(x,y)
axis equal
title('Trayectoria')
xlabel('x')
ylabel('y')

u = UU(:,1:2:end);
v = UU(:,2:2:end);
Ek = 0.5*C.m*(u.^2+v.^2);
Ep = C.g*C.m*y;
figure(220)
subplot(2,1,1)
plot(t,Ek)
subplot(2,1,2)
plot(t,Ep)
hold all
plot(t,Ep+Ek)
hold off