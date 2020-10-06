function [iR,iV]= CircuitoControl3(R,V)
Req = [-R(1) -R(2) 0 0 -R(5) 0 0;
    0 -R(2) 0 0 -R(5) -R(6) 0;
    0 -1 -1 0 0 0 -1;
    -1 1 0 -1 0 -1 0;
    0 -R(2) 0 -R(4) 0 0 0;
    0 0 -R(3) 0 -R(5) 0 0;
    0 0 0 1 1 0 -1];
Veq = [-V; -V; 0; 0; -V; -V; 0];
Ieq = Req\Veq;
iR = Ieq(1:6);
iV = Ieq(end);
end