%% Temperatura (serie Fourier cuadrada)

nterm=200;
T0=1;
x=linspace(0,1,150);
t=0.001;
s=0;
for n=1:2:nterm
    B=(4*T0)/(n*pi);
    s=s+B*sin(n*x*pi)*exp(-n^2*pi^2*t);
end
plot(x,s)

%% Temperatura (haciendo hold)

nterm=200;
T0=1;
x=linspace(0,1,150);
tiempos=[.001 .002 .005 .01 .02 .05 .1 .2 .3];
for c=1:length(tiempos)
    s=0;
    for n=1:2:nterm
        B=(4*T0)/(n*pi);
        t=tiempos(c);
        s=s+B*sin(n*x*pi)*exp(-n^2*pi^2*t);
    end
plot(x,s)
hold all
end
