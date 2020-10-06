tiradas = 10000;

x = randi(6,tiradas,2);

sx = sum(x,2);
c = 2:12;

n = hist(sx,c)'
Pro = n/tiradas

bar(c,Pro)

%%

Pro = zeros(1,12);

for k=2:12
    
Pro(k) = sum(sx==k)/tiradas;

end

plot(1:12,f,'o');
Pro'

%%

pun = rand(1000000,2);
xx = pun(:,1);
yy = pun(:,2);

plot(xx,yy,'.')
axis equal
xlim([0 1]);
ylim([0 1]);

rad2 = xx.^2 + yy.^2;

sum(rad2<1)/length(pun)

%%
Ec = 1;

s =  randi(2,10,1) - 1.5;                                                                                                                                                                                                                                                                                                                    
ins = abs(diff(s));
Ec*sum(ins)-Ec*sum(~ins)