function U=upot(x)
%matriz de distancias
x=[0 x 1];
nump=length(x);
%x=linspace(0,1,nump);
%matriz de cargas
q=ones(size(x));
m1=repmat(x,nump,1);
%m1=meshgrid(x)
d=abs(m1-m1');
d1=d+eye(nump);
invd=1./d1-eye(nump);

U=.5*q*invd*q';