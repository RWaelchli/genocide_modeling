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
L_mean = linspace(0,1,5);
L_std = 0.1;
k_L = 0.1;
T_mean = linspace(-1,1,5);
T_std = 0.1;

nIter = max_age;

%% Preallocation Output Variables

y_mean = zeros(length(L_mean),length(T_mean));
y_std = zeros(length(L_mean),length(T_mean));

%% Generation of the Model Output

for i=1:size(y_mean,1)
    for j=1:size(y_mean,2)
        y_temp = zeros(1,10);
        for k=1:10
            y_temp(k) = fun_model(N,rho_tot,pop_frac,LEO_to_civ,P,v_civ,v_LEO,k_P,J_max,L_mean(i),L_std,T_mean(j),T_std,k_L,max_age,nIter);
        end
        y_mean(i,j) = mean(y_temp);
        y_std(i,j) = std(y_temp);
        j
    end
    i
end

%% Graphical Representation

f1 = figure(1);
surf(L_mean,T_mean,y_mean)
xlim([0 1])
ylim([-1 1])
zlim([0 200])
xlabel('\mu_L','FontSize',14)
ylabel('\mu_T','FontSize',14)
zlabel('Mean Cumulative Kills','FontSize',14)
[az,el] = view;
az = az + 180;
view(az, el);

saveas(f1,'L_T_dep_mean.png')

f2 = figure(2);
surf(L_mean,T_mean,y_std)
xlim([0 1])
ylim([-1 1])
zlim([0 20])
xlabel('\mu_L','FontSize',14)
ylabel('\mu_T','FontSize',14)
zlabel('Standard Deviation Cumulative Kills','FontSize',14)
view(az, el);

saveas(f2,'L_T_dep_std.png')

%% Export of the Data

dlmwrite('L_T_mean_dep_mean.txt',y_mean,'delimiter','\t','precision','%.6d')
dlmwrite('L_T_mean_dep_std.txt',y_std,'delimiter','\t','precision','%.6d')
dlmwrite('L_T_mean_dep_L_val.txt',L_mean,'delimiter','\t','precision','%.6d')
dlmwrite('L_T_mean_dep_T_val.txt',T_mean,'delimiter','\t','precision','%.6d')
