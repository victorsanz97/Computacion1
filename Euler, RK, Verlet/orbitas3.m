%% Varios astros con interacción mutua

num=10000;
np=4;       %número de astros
G=1;

%Condiciones iniciales
u0=[0 0 0 0];
v0=[0 1 0.6 1];
x0=[0 1 2 0.9];
y0=[0 0 0 0];
m=[1 1e-6 1e-6 1e-6];

t=linspace(0,10,num)';
dt=t(2)-t(1);

u=zeros(num,np);
v=zeros(num,np);
x=zeros(num,np);
y=zeros(num,np);
u(1,:)=u0;
v(1,:)=v0;
x(1,:)=x0;
y(1,:)=y0;

M=repmat(m,length(m),1);
X=x0;
Y=y0;
U=u0;
V=v0;

for k=1:num-1
    XX=repmat(X,length(X),1);
    dX=XX'-XX;   
    YY=repmat(Y,length(Y),1);
    dY=YY'-YY;
    RR=sqrt(dX.^2+dY.^2);
    II=eye(length(RR));
    R3=1./((RR+II).^3)-II;
    R3x=-G*R3.*dX.*M;
    R3y=-G*R3.*dY.*M;
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
plot(x,y)
hold all
plot(0,0,'*r')
axis equal