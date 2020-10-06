%==========================================================================
% jumping rabbit
%==========================================================================
clear all
close all
clc

% probablities for movement
numex = 5000; %número de partículas
Njumps = 20; %número de saltos

deltaE = 4.67e-21; %J
k = 1.38e-23; %J/K
T = 351; %K
xjump = 0.36; %nm %distancia de salto
xl = 2.88; %nm %límite

%Probabilidad
p1 = 0.5*exp(-deltaE/k/T);
p2 = 0.5*exp(-deltaE/k/T);
p3 = 1-p1-p2;
p = [p1 p2 p3];

pcsum = cumsum(p);

d = [-1 1 0];


x = zeros(Njumps,numex);
r=rand;

for i=1:Njumps
    ip = find(r<pcsum);
    x(i+1) = (x(i) + d(1,ip(1)))*0.36;
end

figure(1), hold on
plot(x,'k')
plot(0,0,'xr','MarkerSize',20)
xlabel('x [cm]')
ylabel('y [cm]')

