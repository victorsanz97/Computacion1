%%
for k=1:10
    disp(k^2)
end
%%
k=1;    
while k<11
    disp(k)
    k=k+1;
end
%%
for k=-5:5
    if k~=0
        disp(1/k)
    end
end
%%
for k=-5:5
    if k~=0, disp(1/k), end
end
%%
for k=1:10
    if mod(k,2)==0
        disp('es par')
    else
        disp('es impar')
    end
end
%%
for k=1:10
    if mod(k,2)==0
        disp([num2str(k) ' es par'])
    else
        disp([num2str(k) ' es impar'])
    end
end