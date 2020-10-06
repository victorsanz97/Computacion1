function A = fPenduloMuelle(tt, RRR, UUU,C)

    Rx = RRR(1:2:end);
    Ry = RRR(2:2:end);
    
    r = sqrt(Rx^2 + Ry^2);
    
    Fmuelle = -C.k/C.m*(1-C.L0/r);
    Ax = Fmuelle*Rx;
    Ay = -C.g+Fmuelle*Ry;
    
    A = zeros(size(RRR));
    A(1:2:end) = Ax;
    A(2:2:end) = Ay;
end