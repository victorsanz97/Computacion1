%% Euler MEJORADO
% Atracción gravitatoria con varios astros

U0=[0 1 0 .6 0 1];
R0=[1 0 2 0 .9 0];

dt=20/60000;
t=dt*(0:300000);
num=length(t);
UU=zeros(num,length(U0));
RR=zeros(num,length(R0));
UU(1,:)=U0;
RR(1,:)=R0;

for k=1:num-1
    RR(k+1,:)=RR(k,:)+UU(k,:)*dt;
    A=forbita(t(k),RR(k,:),UU(k,:));
    UU(k+1,:)=UU(k,:)+A*dt;
end
plot(RR(:,1:2:end),RR(:,2:2:end))
axis equal