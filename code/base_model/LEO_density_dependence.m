clear all;
close all;
clc

%% Input Parameters

N = 40;
max_age = 200;
rho_tot = 0.7;
pop_frac = 0.5;
LEO_to_civ = 0:0.004:0.1;
P = 0.025;
v_civ = 2;
v_LEO = 3;
k_P = 2.3;
J_max = 30;
L = 0.8;
T = 0.1;

nIter = max_age;

%% Preallocation Output Variables

y = zeros(length(LEO_to_civ),10);

%% Generation of the Model Output

for i=1:size(y,1)
    for j=1:size(y,2)
        y(i,j) = fun_model(N,nIter,max_age,rho_tot,pop_frac,LEO_to_civ(i),P,v_civ,v_LEO,k_P,J_max,L,T);
    end
end

%% Average and Standard Deviation

violence_mean = mean(y,2);
violence_std = std(y,0,2);


%% Graphical Representation

f1 = figure(1);
hold on
errorbar(LEO_to_civ,violence_mean,violence_std,'ok')
xlim([0 0.1])
ylim([0 120])
xlabel('LEO/Civilian','FontSize',14)
ylabel('Cumulative Kills','FontSize',14)

saveas(f1,'cum_kills_vs_LEO_civ.png')

%% Export of the Data

output = [LEO_to_civ' violence_mean violence_std];

dlmwrite('LEO_density_dependence.txt',output,'delimiter','\t','precision','%.6d')

%% Import of the Data

input = dlmread('LEO_density_dependence.txt');

f1 = figure(1);
errorbar(input(:,1),input(:,2),input(:,3),'ok','LineWidth',1.5)
xlim([0 0.1])
ylim([0 120])
xlabel('LEO/Civilian','FontSize',16)
ylabel('Cumulative Kills','FontSize',16)
set(gca,'FontSize',16)

saveas(f1,'cum_kills_vs_LEO_civ.png')