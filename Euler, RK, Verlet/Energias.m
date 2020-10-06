%% E. cinéticas
x = RR(:,1:2:end);
y = RR(:,2:2:end);
u = UU(:,1:2:end);
v = UU(:,2:2:end);
m = [1000e-6 1e-6 1e-6];
UV = (u.^2+v.^2);
MM = repmat(m,size(UV,1),1);
Ek = MM.*UV/2;
figure(101)
subplot(3,1,1)
plot(t,Ek(:,1),'y')
subplot(3,1,2)
plot(t,Ek(:,2),'b')
subplot(3,1,3)
plot(t,Ek(:,3),'r')

%% Distancia entre planetas

d13=sqrt((x(:,1)-x(:,3)).^2+(y(:,1)-y(:,3)).^2);
figure(102)
plot(t,d13)