%% Control 1_2

%Serie de Leibniz utilizada para hallar pi, si se multiplica por 4

L = 1:10000;
fL = zeros(size(L));
for l = 0:length(L)
        fL = fL+(-1)^l/(2*l+1);
end
plot(L,fL)
title('Serie de Leibniz')
xlabel('Límite superior (L)')
ylabel('Valor del sumatorio (f(L))')
legend('pi/4')

%% Corregido
k=0:100;
f=cumsum((-1).^k./(2*k+1));
plot(k,f)
hold all
plot(k,pi/4*ones(size(k)))
xlabel('L')
ylabel('f(L)')
title('Fórmula de Leibniz')
hold off