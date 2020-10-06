%============
% CANNONBALL
%============
clear all, clc, close all


% constants
gEarth     = -9.79757; % m/s^2
gMoon      = -1.622;   % m/s^2

% input values
N     = 100;     % points
x0    = 3.;      % m
y0    = 2.;      % m
v0    = 10.;     % m/s (NOTE: total velocity!)


N = 10000;

% pick random angles
alpha_min = 5;
alpha_max = 85;
alpha     = alpha_min+rand(N,1)*(alpha_max-alpha_min);

% inital velocity transformed to [vxy, vy0]
vx0   = v0*cos(alpha * 2*pi/360.);
vy0   = v0*sin(alpha * 2*pi/360.);

% time arrays (Note: Tend is the time until return to y=y0)
TendEarth  = -(2*vy0)/gEarth;
TendMoon   = -(2*vy0)/gMoon;

% analytical cannonball solution
xEarth  = x0  + vx0.*TendEarth;
xMoon   = x0  + vx0.*TendMoon;

[p,sEarth] = hist(xEarth);
pEarth     = normalise(p,sEarth);
[p,sMoon]  = hist(xMoon);
pMoon      = normalise(p,sMoon);

% probability distribution
figure(1), hold on
bar(sEarth,pEarth)
bar(sMoon, pMoon,'r')
xlabel('x [m]')
ylabel('p(x)')

% correlation
figure(2), hold on
plot(alpha,xEarth/xEarth(end),'.')
plot(alpha,xMoon/xMoon(end),'r.')
xlabel('alpha')
ylabel('x [m]')