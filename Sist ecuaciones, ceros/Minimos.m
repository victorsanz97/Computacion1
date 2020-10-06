%% Mínimos de una función
%fminsearch busca un minimo de una funcion fminsearch(f,x0)
%fminbnd(f,x1,x2) busca el valor minimo en un intervalo cerrado
f=@(x) sin(x)./x;
fminsearch(f,3)
fminbnd(f,0,1)

%% Mínimo de energía
%Calcular la posicion de nump cargas iguales confinadas en (0,0) y (1,0) para
%que la energia sea minima

% %matriz de distancias
% nump=5;
% x=linspace(0,1,nump);
% m1=repmat(x,nump,1);
% m1=meshgrid(x)
% d=abs(m1-m1');
% d1=d+eye(nump);
% invd=1./d1-eye(nump);
% %matriz de cargas
% q=ones(size(x));

% U=.5*q*invd*q';
%definida en la funcion upot

xini=.1:.1:.9;
xfin=fminsearch(@upot,xini)
umin=upot(xfin)
plot([0 xfin 1],'-o')

%% Dando valores a la carga
xini=.1:.1:.9;
q=ones(size(xini));
q=[4 q 4];
ff=@(x) upotQ(q,x);
xfin=fminsearch(ff,xini)
umin=upot(xfin)
plot([0 xfin 1],'-o')
hold all