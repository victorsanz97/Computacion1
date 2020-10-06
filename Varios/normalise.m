%=======================================================================
% normalise the integral over p to unity
% Note:
%   we expect the number of elements in p() and x() to be identical
%=======================================================================
function [f] = normalise(p,x)

N = length(p);

dx = diff(x);

il = [1:N-1];
ir = [2:N];

Fi = (p(il)+p(ir))./2.*dx;

Imid = sum(Fi);

f = p./Imid;

end