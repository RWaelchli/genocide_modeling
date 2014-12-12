clear all;
close all;
clc;

%% Input Parameters

N = 40;
max_age = 200;
rho_tot = 0.7;
pop_frac = 0.5;
LEO_to_civ = 0.05;
P = 0.025;
v_civ = 2;
v_LEO = 3;
k_P = 2.3;
J_max = 30;
L_mean = 0.8;
L_std = 0:0.05:1;
k_L = 0.1;
T_mean = 0.1;
T_std = L_std;

nIter = max_age;

%% Preallocation Output Variables

y = zeros(length(L_std),10);

%% Generation of the Model Output

for i=1:size(y,1)
    for j=1:size(y,2)
        y(i,j) = fun_model(N,rho_tot,pop_frac,LEO_to_civ,P,v_civ,v_LEO,k_P,J_max,L_mean,L_std(i),T_mean,T_std(i),k_L,max_age,nIter);
    end
end

%% Average and Standard Deviation

violence_mean = mean(y,2);
violence_std = std(y,0,2);

%% Graphical Representation

f1 = figure(1);
errorbar(L_std(2:end),violence_mean(2:end),violence_std(2:end),'ok')
xlim([0 1])
ylim([0 120])
xlabel('\sigma_L = \sigma_T','FontSize',14)
ylabel('Cumulative Kills','FontSize',14)

saveas(f1,'L_T_std_dep.png')

%% Export of the Data

output = [L_std' violence_mean violence_std];

dlmwrite('L_T_std_dep.txt',output,'delimiter','\t','precision','%.6d')

%% Import of the Data

input = dlmread('L_T_std_dep.txt');

f1 = figure(1);
errorbar(input(2:end,1),input(2:end,2),input(2:end,3),'ok','LineWidth',1.5)
xlim([0 1])
ylim([0 120])
xlabel('\sigma_L = \sigma_T','FontSize',16)
ylabel('Cumulative Kills','FontSize',16)
set(gca,'FontSize',16)

saveas(f1,'L_T_std_dep.png')