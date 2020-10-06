%%
[X,Y,Z] = peaks(25);

figure
%surf(X,Y,Z);
contourf(X,Y,Z,30);
%%
[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2);
Z = sin(R)./R;

figure
mesh(X,Y,Z)

%% Potencial electrostático
[X,Y]=meshgrid(-3:.125:3);
V1=@(x,y,q) q./sqrt(x.^2+y.^2);
x=-5:.1:5;
surf(X,Y,V1(X,Y,1))

%% con 2 cargas positivas
V=@(x0,y0,x,y,q)  q./sqrt((x-x0).^2+(y-y0).^2);
Z=V(1,0,X,Y,1)+V(-1,0,X,Y,-1);
mesh(X,Y,Z)

%% 4 cargas positivas
Z=V(1,0,X,Y,1)+V(-1,0,X,Y,1)+V(0,1,X,Y,1)+V(0,-1,X,Y,1);
mesh(X,Y,Z)

%% 2 positivas 2 negativas
Z=V(1,0,X,Y,1)+V(-1,0,X,Y,1)+V(0,1,X,Y,-1)+V(0,-1,X,Y,-1);
mesh(X,Y,Z)

%% suma con bucle
qq=[.2 1 -1 -1];
xx0=[1 -1 0 0];
yy0=[0 0 1 -1];
z=zeros(size(X));
for k=1:length(qq)
    Z=Z+V(xx0(k),yy0(k),X,Y,qq(k));
end
%mesh(X,Y,Z)
contourf(X,Y,Z)