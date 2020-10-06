fsys= @forbita;
U0 = [0 1 0 .6 0 1];
R0 = [1 0 2 0 .9 0];
dt = 1/300;
numpinta = 1000; % número de puntos que se guardan y pintan
numno = 20; % número de puntos calculados por cada punto pintado


%% Runge Kutta (con interaccion entre los planetas)
t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;
fsys = @forbitaInt;
figure(100)
hs = plot(0,0,'o');
set(hs,'markerfacecolor','r','markersize',10);
    axis equal
    hold on
hp = plot(R0(1),R0(2),'o',R0(3),R0(4),'o',R0(5),R0(6),'o');
set(hp(1),'markerfacecolor','b');
set(hp(2),'markerfacecolor','g');
set(hp(3),'markerfacecolor','k');
xlim([-3 3])
ylim([-3 3])
%%

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
    set(hp(2),'xdata',RRR(3),'ydata',RRR(4))
    set(hp(3),'xdata',RRR(5),'ydata',RRR(6))
    drawnow
    
    %%
    
    
end

figure(60)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
title('RungeKutta (con interaccion entre los planetas)')
xlabel('x')
ylabel('y')
axis equal
disp('Runge-Kutta (con interaccion entre los planetas):    ')
