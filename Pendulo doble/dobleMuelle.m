function A = fPenduloMuelle(tt, RRR, UUU,C)

    Rx1 = RRR(1:4:end);
    Ry1 = RRR(2:4:end);
    
    Rx2 = RRR(3:4:end);
    Ry2 = RRR(4:4:end);
    
    Rx12 = Rx2 - Rx1;
    Ry12 = Ry2 - Ry1;
    
    dX = Rx2 - Rx1;
    dY = Ry2 - Ry1;
    
    r = sqrt(dX^2 + dY^2);
    
    Fmuelle = C.k*(r-C.L0)/r;
    
    Ax1 = Fmuelle/C.m(1)*Rx12;
    Ay1 = - C.g + Fmuelle/C.m(1)* Ry12;
    
    Ax2 = - Fmuelle/C.m(2)*Rx12;
    Ay2 = - C.g - Fmuelle/C.m(2)* Ry12;
    
    A = zeros(size(RRR));
    A(1:4:end) = Ax1;
    A(2:4:end) = Ay1;
    A(3:4:end) = Ax2;
    A(4:4:end) = Ay2;
    
end