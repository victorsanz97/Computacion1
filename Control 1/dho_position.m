% Exercise 1.A
function [pos]=dho_position(m,c,k,x0,t)
omega0=sqrt(k/m);
gamma=c/(2*m);
dseta=c/(2*sqrt(m*k));
phi=acos(sqrt(1-dseta^2));
pos=x0/sqrt(1-dseta^2)*exp(-gamma*t)*cos(sqrt(1-dseta^2)*omega0*t-phi);
end