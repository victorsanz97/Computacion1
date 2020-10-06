%% Control 1_3

a(1) = 7;
a(2) = 9;
N = 1000;
n = 15;
for i = 3:N 
 a(i) = mod(a(i-1)*a(i-2),n); 
end

b(1) = 2;
b(2) = 5;
m = 31;
for j = 3:N
    if mod(b(j-1),2)==1
        b(j) = mod(b(j-1)*b(j-2),m);
    else
        b(j) = mod((b(j-1)-1)*b(j-2),m);
    end
end

j = 1:1000;
figure
plot(j,b)
title('Sucesión b_i')
xlabel('i-elemento de la sucesión')
ylabel('Valor de la sucesión')
legend('b_i')

%Creo una subsucesión de b(i) con sus primero 50 elementos para verla con
%más claridad

j50 = 1:50;
b50 = b(1:50);
figure
plot(j50,b50)
title('Sucesión b_i entre i=1 e i=50')
xlabel('i-elemento de la sucesión')
ylabel('Valor de la sucesión')
legend('b_i')

i1 = 950:1000;
j1 = 950:1000;
a1 = a(950:end);
b1 = b(950:end);
figure
plot(i1,a1)
hold all
plot(j1,b1)
title('Sucesiones a y b entre i=950 e i=1000')
xlabel('i-elemento de la sucesión')
ylabel('Valor de la sucesión')
legend('a_i','b_i')