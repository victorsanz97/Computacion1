function [zeros]=saca0s (t,f)
ff=f(1:end-1).*f(2:end) ; % atención, tiene un elemento menos
t_mid=(t(1:end-1)+t(2:end))./2 ; % puntos medios de los intervalos
b_negativos=ff<0 ; % generar vector lógico
zeros=t_mid(b_negativos) % extraer b_negativos de x_mid