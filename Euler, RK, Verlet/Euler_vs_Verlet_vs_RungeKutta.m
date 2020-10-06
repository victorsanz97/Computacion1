%% Ecuaciones del movimiento
% La integración de las ecuaciones del movimiento de un sistema dinámico
% puede realizarse utilizando diversos métodos numéricos. El más sencillo
% es el método de Euler, sin embargo requiere un paso de tiempo muy
% pequeño. El método de Verlet (velocity Verlet) es muchísimo más preciso a
% peasar de tener un idéntico coste computacional. El método de Runge-Kutta
% puede ser el más adecuado en muchos casos pero requiere 4 veces más
% cálculos.

% Como ejemplo vamos a resolver el problema de 3 planetas de igual masa
% orbitando alrededor de un sol fijo.
% CONCLUSION: nunca utilizar Euler, si es posible usar Verlet.



fsys = @forbita; % esta función tiene la definición del sistema
U0 = [0 1 0 .6 0 1];
R0 = [1 0 2 0 .9 0];
dt = 1/300;
numpinta = 1000; % número de puntos que se guardan y pintan
numno = 20; % número de puntos calculados por cada punto pintado

%% Método de Euler

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
        A = fsys(tt,RRR,UUU); 
        tt = dt + tt;
        RRR = RRR + UUU*dt;
        UUU = UUU + A*dt;
    end
    RR(k+1,:) = RRR;
    UU(k+1,:) = UUU;
    t(k+1) = tt; 
end

figure(10)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
axis equal
title('Euler')
xlabel('x')
ylabel('y')
disp('EULER:   ')
toc


%% Velocity Verlet
t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;

tic
A = fsys(tt,RRR,UUU); 
for k=1:numpinta-1
    for k1=1:numno;
        tt = dt + tt;
        UU2 = UUU + A*dt/2;  % v(t+dt/2)    
        RRR = RRR + UU2*dt;  % x(t+dt)
        A = fsys(tt,RRR,UUU);  % a(t+dt)
        UUU = UU2 + A/2*dt;
    end
    RR(k+1,:) = RRR;
    UU(k+1,:) = UUU;
    t(k+1) = tt;
end

figure(20)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
title('Velocity Verlet')
xlabel('x')
ylabel('y')
axis equal
disp('Velocity Verlet:    ')
toc

%% Velocity Verlet (aceleración independiente de U)
t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;

fsys = @forbitaR;

tic
A = fsys(tt,RRR); 
for k=1:numpinta-1
    for k1=1:numno;
        tt = dt + tt;
        RRR = RRR + UUU*dt +1/2*A*dt^2;  % x(t+dt)
        Aold = A;
        A = fsys(tt,RRR);  % a(t+dt)
        UUU = UUU + (A+Aold)/2*dt;
    end
    RR(k+1,:) = RRR;
    UU(k+1,:) = UUU;
    t(k+1) = tt;
    
end


figure(30)

plot(RR(:,1:2:end),RR(:,2:2:end))
title('Velocity Verlet(no U dependence)')
xlabel('x')
ylabel('y')
axis equal
disp('Velocity Verlet(no U dependence):    ')
toc




%% Runge Kutta
t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;
fsys = @forbita;


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

figure(40)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
title('RungeKutta')
xlabel('x')
ylabel('y')
axis equal
disp('Runge-Kutta:    ')
toc

%% Velocity Verlet (con interacción entre los planetas)
t = zeros(1,numpinta);
UU = zeros(numpinta,length(U0));
RR = UU;
UU(1,:) = U0;
RR(1,:) = R0;
UUU = UU(1,:);
RRR = RR(1,:);
tt = 0;
fsys = @forbitaInt;

tic
A = fsys(tt,RRR,UUU); 
for k=1:numpinta-1
    for k1=1:numno;
        tt = dt + tt;
        UU2 = UUU + A*dt/2;  % v(t+dt/2)    
        RRR = RRR + UU2*dt;  % x(t+dt)
        A = fsys(tt,RRR,UUU);  % a(t+dt)
        UUU = UU2 + A/2*dt;
    end
    RR(k+1,:) = RRR;
    UU(k+1,:) = UUU;
    t(k+1) = tt;
end

figure(50)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
title('Velocity Verlet (con interaccion entre los planetas)')
xlabel('x')
ylabel('y')
axis equal
disp('Velocity Verlet (con interaccion entre los planetas):    ')
toc

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

figure(60)

x = RR(:,1:2:end);
y = RR(:,2:2:end);
plot(x,y)
title('RungeKutta (con interaccion entre los planetas)')
xlabel('x')
ylabel('y')
axis equal
disp('Runge-Kutta (con interaccion entre los planetas):    ')
toc