function A = fexamen(t,R,U)
% k = 100;
% m = 1;
% g = 1;
% l = 1;
x = R(1);


q=1e-6;    %C
D1=-2e6;    %N/C*m
D2=3e7;    %N/C*m
D3=-1e8;    %N/C*m
m=1e-2;     %kg
qm=q/m;

a=qm*(D1*x+D2*(x.^2)+D3*(x.^3));

A = [a];

end