%==========================================================================
% jumping rabbit
%==========================================================================
clear all
close all
clc

% probablities for movement
p = [0.25 0.25 0.25 0.25];
d = [3 4 -1 3;
    -2 1 -1 2;
     0 2 -3 1];
pcsum = cumsum(p);

Njumps = 200;

x = zeros(1,Njumps);
y = zeros(1,Njumps);
z = zeros(1,Njumps);
r=rand;

for i=1:Njumps
    ip = find(r<pcsum);
    x(i+1) = x(i) + d(1,ip(1));
    y(i+1) = y(i) + d(2,ip(1));
    z(i+1) = z(i) + d(2,ip(1));
end

figure(1), hold on
plot(x,y,'k')
plot(0,0,'xr','MarkerSize',20)
xlabel('x [cm]')
ylabel('y [cm]')
plot(x(Njumps),y(Njumps),'xb','MarkerSize',20)
legend('trajectory','start-point','end-point')

%%
% this plots the cumulative probability distribution
figure(2), hold on
set(gca,'fontsize',20)
plot(linspace(0,1,length(pcsum)+1),[0 pcsum],'s','MarkerSize',16,'LineWidth',5)
plot(linspace(0,1,length(pcsum)+1),[0 pcsum],'-','LineWidth',5)
ylabel('cumulative probability','FontSize',20)
xlabel('uniform random number in [0,1]','FontSize',20)


%%

xx = cumsum(x);
yy = cumsum(y);
zz = cumsum(z);
xyz = [xx(end,:)',yy(end,:)',zz(end,:)'];
rnx = [min(xyz(:,1)):max(xyz(:,1))];
rny = [min(xyz(:,2)):max(xyz(:,2))];
rnz = [min(xyz(:,3)):max(xyz(:,3))];
nn = hist3(xyz,{rnx,rny,rnz});
prob = nn/numex;

figure(10)
pcolor(rnx,rny,prob')