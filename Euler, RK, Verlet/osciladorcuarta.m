%% Ecuaciones del movimiento (oscilador x^4)

fsys = @foscill; % esta funci?n tiene la definici?n del sistema
U0 = [1 0 0 0];
R0 = [0 0 0 0];
t = [];


%% Runge-Kutta

dt = 1/300;
numpinta = 2000; % n?mero de puntos que se guardan y pintan
numno = 1; % n?mero de puntos calculados por cada punto pintado

t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;
tic
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
end
disp('Runge-Kutta:    ')
toc 
x = RR(:,1);
y = RR(:,2);
plot(x,y)
 
xlabel('x')
ylabel('y')
axis equal

figure(211)
plot(t,x)
hold all
title(['Runge-Kutta, dt=' num2str(dt)])