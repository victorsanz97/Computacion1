numex = 1000000;
N = 100;
L = 1;
pasos = randi(3,N,numex)-2;
sp = sum(pasos);
x = [min(sp):max(sp)]; %Número de veces que llega a cada posición
n = hist(sp,x);
prob = n/numex;
%bar(x,prob)
plot(x,prob)

%%
numex = 1000;
N = 100;
p = 0.5;
pasos = 2*(rand(N,numex)<p)-1;
sp = sum(pasos);
x = [min(sp):max(sp)]; %Número de veces que llega a cada posición
n = hist(sp,x);
prob = n/numex;
bar(x,prob)
%plot(x,prob)
mean(sp)

%%
numex = 10000;
N = 100;
p1 = 0.1;
p2 = 0.4;
p3 = 0.2;
p4 = 0.2;
p5 = 0.1;

pp = cumsum([p1 p2 p3 p4 p5]);

ra = rand(N,numex);
y  = -(ra<=pp(1))+((ra>pp(1)) & (ra<pp(2)));
x  = -((ra>pp(2)) & (ra<pp(3))) + ((ra>pp(3)) & (ra<pp(4)));
xx = cumsum(x);
yy = cumsum(y);

plot(xx,yy)
plot(xx(:,1),yy(1,:),'o')
% xy = [xx(end,:)',yy(end,:)'];
% rnx = [min(xy(:,1)):max(xy(:,1))];
% rny = [min(xy(:,2)):max(xy(:,2))];
% 
% nn = hist3(xy,{rnx,rny});
% prob = nn/numex;
% 
% figure(10)
% pcolor(rnx,rny,prob')
% h = colormap('spring');
% set(h,'LineStyle','None');
% colorbar