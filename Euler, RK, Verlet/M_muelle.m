fsys = @fmuelle2d; % esta funci�n tiene la definici�n del sistema
U0 = [1 .5];
R0 = [0 1];
dt = 1/200;
numpinta = 240; % n�mero de puntos que se guardan y pintan
numno = 10; % n�mero de puntos calculados por cada punto pintado



%% Velocity Verlet
t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;

% tic
A = fsys(tt,RRR,UUU); 
for k=1:numpinta-1
    for k1=1:numno;
        tt = dt + tt;
        UU2 = UUU + A*dt/2;  % v(t+dt/2)    
        RRR = RRR + UUU*dt;  % x(t+dt)
        A = fsys(tt,RRR,UUU);  % a(t+dt)
        UUU = UU2 + A/2*dt;
    end
    RR(k+1,:) = RRR;
    UU(k+1,:) = UUU;
    t(k+1) = tt;
end

% for k=1:numpinta-1
%     for k1=1:numno;
%         K1x = UUU;
%         K1u = fsys(tt,RRR,UUU);
%         K2x = UUU + dt/2*K1u;
%         K2u = fsys(tt+dt/2,RRR+dt/2*K1x,UUU+dt/2*K1u);
%         K3x = UUU + dt/2*K2u;
%         K3u = fsys(tt+dt/2,RRR+dt/2*K2x,UUU+dt/2*K2u);
%         K4x = UUU + dt*K3u;
%         K4u = fsys(tt+dt,RRR+dt*K3x,UUU+dt*K3u);
%         
%         tt = dt + tt;
%         RRR = RRR + dt/6*(K1x+2*K2x+2*K3x+K4x);
%         UUU = UUU + dt/6*(K1u+2*K2u+2*K3u+K4u);
%     end
%     RR(k+1,:) = RRR;
%     UU(k+1,:) = UUU;
%     t(k+1) = tt; 
% end




figure(20)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
title('Velocity Verlet')
xlabel('x')
ylabel('y')
axis equal
figure(22)
subplot(2,1,1)
ome0 = 1;
gam = .3;
ome2 = ome0^2;
dseta = gam/2/ome0;
xt = sin(ome0*sqrt(1-dseta^2)*t).*exp(-gam/2*t);
plot(t,x,t,xt)
xlabel('t')
ylabel('x')
subplot(2,1,2)
plot(t,y)
xlabel('t')
ylabel('y')
