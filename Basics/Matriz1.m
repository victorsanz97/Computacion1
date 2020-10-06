xe=3*2*pi;
dx=2*pi/20;
x=-xe:dx:xe;
y=sin(x)./x;
figure(10)
plot(x,y,'-or')

%%
x=-10:0.1:10;
y=sin(x)./x;
%%
xF=[];
yF=[];
for k=1:200,
    xF(k)=-10+(k-1)*0.1;
    yF(k)=sin(xF(k))/xF(k);
end