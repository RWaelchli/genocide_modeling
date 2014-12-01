close all
clear all
clc

tic

%% Fixed Input Data

N = 40; % size of the map
nIter = 50;
max_age = 200;

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

%% Generation of the Random Sample

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

resamp_index = unidrnd(size(M1,1),size(M1,1),size(M1,2));
M2 = zeros(size(M1));

for i =1:n
    for j=1:10
        M2(i,j) = M1(resamp_index(i,j),j);
    end
end


% y = fun_model(N,0.7,0.5,0.02,0.05,2,3,2.3,30,0.1,0.8,200,1.5e2);

a_0 = zeros(n,1);
a_1 = zeros(n,1);
a_2 = zeros(n,1);
a_3 = zeros(n,1);
a_4 = zeros(n,1);
a_5 = zeros(n,1);
a_6 = zeros(n,1);
a_7 = zeros(n,1);
a_8 = zeros(n,1);
a_9 = zeros(n,1);
a_10 = zeros(n,1);
a_12345678910 = zeros(n,1);

for i = 1:n
    a_0(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_1(i) = fun_model(N,M1(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_2(i) = fun_model(N,M2(i,1),M1(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_3(i) = fun_model(N,M2(i,1),M2(i,2),M1(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_4(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M1(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_5(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M1(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_6(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M1(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_7(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M1(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_8(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M1(i,8),M2(i,9),M2(i,10),max_age,nIter);
    a_9(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M1(i,9),M2(i,10),max_age,nIter);
    a_10(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M1(i,10),max_age,nIter);
    a_12345678910(i) = fun_model(N,M1(i,1),M1(i,2),M1(i,3),M1(i,4),M1(i,5),M1(i,6),M1(i,7),M1(i,8),M1(i,9),M1(i,10),max_age,nIter);
    i
end

E = sqrt(1/n*sum(a_12345678910.*a_0));
V = 1/n*sum((a_0-E).^2);

U_1 = 1/(n-1)*sum(a_12345678910.*a_1);
U_2 = 1/(n-1)*sum(a_12345678910.*a_2);
U_3 = 1/(n-1)*sum(a_12345678910.*a_3);
U_4 = 1/(n-1)*sum(a_12345678910.*a_4);
U_5 = 1/(n-1)*sum(a_12345678910.*a_5);
U_6 = 1/(n-1)*sum(a_12345678910.*a_6);
U_7 = 1/(n-1)*sum(a_12345678910.*a_7);
U_8 = 1/(n-1)*sum(a_12345678910.*a_8);
U_9 = 1/(n-1)*sum(a_12345678910.*a_9);
U_10 = 1/(n-1)*sum(a_12345678910.*a_10);

S_1 = (U_1-E^2)/V;
S_2 = (U_2-E^2)/V;
S_3 = (U_3-E^2)/V;
S_4 = (U_4-E^2)/V;
S_5 = (U_5-E^2)/V;
S_6 = (U_6-E^2)/V;
S_7 = (U_7-E^2)/V;
S_8 = (U_8-E^2)/V;
S_9 = (U_9-E^2)/V;
S_10 = (U_10-E^2)/V;

U_min1 = 1/(n-1)*sum(a_0.*a_1);
U_min2 = 1/(n-1)*sum(a_0.*a_2);
U_min3 = 1/(n-1)*sum(a_0.*a_3);
U_min4 = 1/(n-1)*sum(a_0.*a_4);
U_min5 = 1/(n-1)*sum(a_0.*a_5);
U_min6 = 1/(n-1)*sum(a_0.*a_6);
U_min7 = 1/(n-1)*sum(a_0.*a_7);
U_min8 = 1/(n-1)*sum(a_0.*a_8);
U_min9 = 1/(n-1)*sum(a_0.*a_9);
U_min10 = 1/(n-1)*sum(a_0.*a_10);

S_1T = 1-(U_min1-E^2)/V;
S_2T = 1-(U_min2-E^2)/V;
S_3T = 1-(U_min3-E^2)/V;
S_4T = 1-(U_min4-E^2)/V;
S_5T = 1-(U_min5-E^2)/V;
S_6T = 1-(U_min6-E^2)/V;
S_7T = 1-(U_min7-E^2)/V;
S_8T = 1-(U_min8-E^2)/V;
S_9T = 1-(U_min9-E^2)/V;
S_10T = 1-(U_min10-E^2)/V;

toc
