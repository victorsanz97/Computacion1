%% F(X)

xx=0:.1:10;
yy=1./cos(xx);
plot(xx,yy,'k')
ylim([-5,5])
xlabel('x')
ylabel('y')
title('y vs x')
hold all
y1=cos(xx);
plot(xx,y1,'r')
hold off

%%
xx=0:.01:10;
xx=pi*xx;
yy=(1./sin(xx));
figure(2)
plot(xx,yy)
hold all

%%
xx=0:.0001:4;
yy=sin(3./xx)+cos(xx.^2).^2;
figure(3)
plot(xx,yy)
hold all
ys=yy(yy<0);
xs=xx(yy<0);
plot(xs,ys,'.')

%%

%%
a=pi*1:10;
a(a>3);
%%
a=pi*1:10;
r=a>3;
i=find(r);
a(i)