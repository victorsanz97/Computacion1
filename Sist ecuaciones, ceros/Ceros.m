%% Función
x=linspace(-2,2,100);
y=x.^2+x-3;
plot(x,y)
hold all
plot(xx,zeros(size(xx)))

%% Cero de la función
f=@(x)x.^2+x-3;
x1=0;
y1=f(x1);
x2=2;
y2=f(x2);
epsilon=10^-5;
%x3=(x2*y1-y2*x1)/(y1-y2);
for k=1:10
    x3=(x2*y1-x1*y2)/(y1-y2);
    y3=f(x3);
    disp([k y3])
    if abs(y3)>epsilon
        break
    end
    if y3<0
        x1=x3;
        y1=y3;
    else
        x2=x3;
        y2=y3;
    end
end

%% Usando while
f=@(x)x.^2+x-3;
x1=0;
y1=f(x1);
x2=2;
y2=f(x2);
epsilon=10^-5;
y3=2*epsilon;
k=0;
while abs(y3)>epsilon
     disp(['k=' num2str(k) ' y3=' num2str(y3)])
    x3=(x2*y1-x1*y2)/(y1-y2);
    y3=f(x3);
    k=k+1;
    if y3<0
        x1=x3;
        y1=y3;
    else
        x2=x3;
        y2=y3;
    end
end
disp(['x3=' num2str(x3)])

%Método de la bisección x3=(x2-x1)/2


%% Método de Newton-Raphson
%Método de Newton-Raphson xN=x0-(f(x0)/f'(x0)) f'(x0)=(f(x0+Ax)-f(x0))/Ax
f=@(x)x.^2+x-3;
df=@(x)2*x+1;
x0=0;
y0=f(x0);
epsilon=10^-5;
for k=1:10
    xN=x0-y0/df(x0);
    yN=f(xN);
    disp(['k=' num2str(k) ' f(xN)=' num2str(yN)])
    if yN<epsilon
        break
    else
        x0=xN;
        y0=yN;
    end
end
disp(['xN=' num2str(xN)])

%% Método de Newton-Raphson sin derivada analítica
f=@(x)x.^2+x-3;
x0=0;
y0=f(x0);
epsilon=10^-5;
dx=.001;
for k=1:10
    df=(f(x0+dx)-y0)/dx;
    xN=x0-y0/df;
    yN=f(xN);
    disp(['k=' num2str(k) ' f(xN)=' num2str(yN)])
    if yN<epsilon
        break
    else
        x0=xN;
        y0=yN;
    end
end
disp(['xN=' num2str(xN)])

%% Otra función
f=@(x) sin(x)./x;
x=linspace(0,30,1000);
plot(x,f(x))
hold all
plot(x,zeros(size(x)))
x0=9;
y0=f(x0);
epsilon=10^-7;
dx=.0001;
for k=1:10
    derf=(f(x0+dx)-y0)/dx;
    xN=x0-y0/derf;
    yN=f(xN);
    disp(['k=' num2str(k) ' f(xN)=' num2str(yN)])
    if abs(yN)<epsilon
        break
    else
        x0=xN;
        y0=yN;
    end
end
disp(['xN=' num2str(xN)])

%% Otra función
f=@(x) tan(x)-x;
x=linspace(0,30,1000);
plot(x,f(x))
x0=1;
y0=f(x0);
epsilon=10^-7;
dx=.0001;
for k=1:10
    derf=(f(x0+dx)-y0)/dx;
    xN=x0-y0/derf;
    yN=f(xN);
    disp(['k=' num2str(k) ' f(xN)=' num2str(yN)])
    if yN<epsilon
        break
    else
        x0=xN;
        y0=yN;
    end
end
disp(['xN=' num2str(xN)])

%se puede utilizar la funcion fzero(funcion,x0) para calcular el 0
%o fzero(function,x0,options) para dar opciones