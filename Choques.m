%% Choques

%Condiciones iniciales
u0=[1 0];
v0=[0 0];
x0=[-10 0];
y0=[0 0];
epsilon=1;
rm=1;

dt=.0002;
t=0:dt:11;
num=length(t);
np=length(u0);      %np número de partículas

u=zeros(num,np);
v=zeros(num,np);
x=zeros(num,np);
y=zeros(num,np);
u(1,:)=u0;
v(1,:)=v0;
x(1,:)=x0;
y(1,:)=y0;

X=x0;
Y=y0;
U=u0;
V=v0;

rm6=rm^6;
rm12=rm^12;

for k=1:num-1
    XX=repmat(X,length(X),1);
    dX=XX'-XX;   
    YY=repmat(Y,length(Y),1);
    dY=YY'-YY;
    RR=sqrt(dX.^2+dY.^2);
    II=eye(length(RR));
    R8=1./((RR+II).^8)-II;
    R14=1./((RR+II).^14)-II;
    R3=epsilon*(rm6*R8-rm12*R14);
    R3x=R3.*dX;
    R3y=R3.*dY;
    fx=sum(R3x,2);
    fy=sum(R3y,2);
   
    X=X+dt*U;
    U=U+dt*fx';
    Y=Y+dt*V;
    V=V+dt*fy';
    x(k+1,:)=X;
    y(k+1,:)=Y;
    u(k+1,:)=U;
    v(k+1,:)=V;
end
figure(1)
plot(x,y)
axis equal
hold all
plot(0,0,'*r')
figure(2)
plot(t,x,t,y)
