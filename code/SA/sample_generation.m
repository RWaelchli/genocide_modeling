close all
clear all
clc

%% Bounds of the Investigated Parameters

rho_tot_a = 0.1;
rho_tot_b = 0.9;

pop_frac_a = 0.1;
pop_frac_b = 0.9;

LEO_to_civ_a = 0;
LEO_to_civ_b = 0.1;

P_a = 0.001;
P_b = 0.05;

v_civ_a = 0.5;
v_civ_b = 5.49999;

v_LEO_a = 0.5;
v_LEO_b = 5.49999;

k_a = 1;
k_b = 3;

J_max_a = 10;
J_max_b = 200;

T_a = 0;
T_b = 0.5;

L_a = 0.1;
L_b = 0.9;

%% Generation of the Sampling Matrix

n = 1e3; % number of samples to be generated

p = sobolset(10,'Skip',1e3,'Leap',1e2); % point set of random numbers generated using Sobol's method
p = scramble(p,'MatousekAffineOwen');

M1 = net(p,n);

for i=1:size(M1,1)
    M1(i,1) = M1(i,1)*(rho_tot_b-rho_tot_a)+rho_tot_a;
    M1(i,2) = M1(i,2)*(pop_frac_b-pop_frac_a)+pop_frac_a;
    M1(i,3) = M1(i,3)*(LEO_to_civ_b-LEO_to_civ_a)+LEO_to_civ_a;
    M1(i,4) = M1(i,4)*(P_b-P_a)+P_a;
    M1(i,5) = M1(i,5)*(v_civ_b-v_civ_a)+v_civ_a;
    M1(i,5) = round(M1(i,5));
    M1(i,6) = M1(i,6)*(v_LEO_b-v_LEO_a)+v_LEO_a;
    M1(i,6) = round(M1(i,6));
    M1(i,7) = M1(i,7)*(k_b-k_a)+k_a;
    M1(i,8) = M1(i,8)*(J_max_b-J_max_a)+J_max_a;
    M1(i,8) = round(M1(i,8));
    M1(i,9) = M1(i,9)*(T_b-T_a)+T_a;
    M1(i,10) = M1(i,10)*(L_b-L_a)+L_a;
end

%% Generation of the Resampling Matrix

p = sobolset(10,'Skip',1e3,'Leap',1e2); % point set of random numbers generated using Sobol's method
p = scramble(p,'MatousekAffineOwen');

resamp_index = net(p,n);
M2 = zeros(size(M1));

ind_a = 0.5;
ind_b = size(M1,1)+0.499999999;

for i=1:size(M1,1)
    for j=1:size(M1,2)
        resamp_index(i,j) = resamp_index(i,j)*(size(M1,1)-1)+1;
        resamp_index(i,j) = round(resamp_index(i,j));
        M2(i,j) = M1(resamp_index(i,j),j);
    end
end

%% Writing Data Into Files

fileID = fopen('M1.txt','w');
for i=1:size(M1,1)
    fprintf(fileID,'%d %d %d %d %d %d %d %d %d %d\n',M1(i,:));
end
fclose(fileID);

fileID = fopen('M2.txt','w');
for i=1:size(M2,1)
    fprintf(fileID,'%d %d %d %d %d %d %d %d %d %d\n',M2(i,:));
end
fclose(fileID);
