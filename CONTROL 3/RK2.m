% RUNGE-KUTTA DE SEGUNDO ORDEN

function [f1,f2,x]=RK2(g1,g2,x0,f10,f20,xN,dx);
clear x f1 f2

x=[x0:dx:xN];
N=length(x)-1;
f1=zeros(1,N+1);
f2=zeros(1,N+1);
f1(1)=f10;
f2(1)=f20;
for i=1:N
    Gaux1=g1(f1(i),f2(i),x(i));
    Gaux2=g2(f1(i),f2(i),x(i));
    f1trial=f1(i)+Gaux1*dx/2;
    f2trial=f2(i)+Gaux2*dx/2;
    Gaux1=g1(f1trial,f2trial,x(i)+dx/2);
    Gaux2=g2(f1trial,f2trial,x(i)+dx/2);
    f1(i+1)=f1(i)+Gaux1*(x(i+1)-x(i));
    f2(i+1)=f2(i)+Gaux2*(x(i+1)-x(i));
end
end


