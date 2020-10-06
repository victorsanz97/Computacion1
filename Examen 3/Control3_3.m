%% Control3_3
close all
clear all
clc

%%
for i=1:0.01:15
V = 8; %voltios
R1 = 2; %ohmios
R2 = 15; %ohmios
R3 = i-1; %ohmios
R4 = 14; %ohmios
R5 = 10; %ohmios
R6 = 8; %ohmios
R = [R1 R2 R3 R4 R5 R6];
[iR,iV] = CircuitoControl3(R,V);
end

%% Plot I vs R

I1 = [-0.3744 -0.5125 -0.6869 -0.9139 -1.2216 -1.6623 -2.3463 -3.5515 -6.2403 -17.5385 31.3600 9.1528 5.6435 4.2135 3.4372];
I3 = [-1.3679 -1.5265 -1.7267 -1.9873 -2.3406 -2.8468 -3.6321 -5.0160 -8.1035 -21.0769 35.0720 9.5721 5.5424 3.9004 3.0089];
I6 = [-0.0936 -0.1281 -0.1717 -0.2285 -0.3054 -0.4156 -0.5866 -0.8879  -1.5601 -4.3846 7.8400 2.2882 1.4109 1.0534 0.8593];
R3 = 0:14;
figure
plot(R3,I1,'k',R3,I3,'b',R3,I6,'r')
hold all
title('I en función de R')
xlabel('Resistencia [ohm]')
ylabel('Intensidad [A]')
legend('I_1','I_3','I_6')
plot(9.358672,2.15e-5,'+')