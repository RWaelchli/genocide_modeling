close all
clear all
clc

tic

%% Import Data

y_A = dlmread('y_A.txt');
y_B = dlmread('y_B.txt');
y_C_1 = dlmread('y_C_1.txt');
y_C_2 = dlmread('y_C_2.txt');
y_C_3 = dlmread('y_C_3.txt');
y_C_4 = dlmread('y_C_4.txt');
y_C_5 = dlmread('y_C_5.txt');
y_C_6 = dlmread('y_C_6.txt');
y_C_7 = dlmread('y_C_7.txt');
y_C_8 = dlmread('y_C_8.txt');
y_C_9 = dlmread('y_C_9.txt');
y_C_10 = dlmread('y_C_10.txt');

n = length(y_A);

%% f_0

f_0_2 = (1/n.*sum(y_A))^2;

%% S_j

S_1 = (1./n.*sum(y_A.*y_C_1)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_2 = (1./n.*sum(y_A.*y_C_2)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_3 = (1./n.*sum(y_A.*y_C_3)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_4 = (1./n.*sum(y_A.*y_C_4)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_5 = (1./n.*sum(y_A.*y_C_5)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_6 = (1./n.*sum(y_A.*y_C_6)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_7 = (1./n.*sum(y_A.*y_C_7)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_8 = (1./n.*sum(y_A.*y_C_8)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_9 = (1./n.*sum(y_A.*y_C_9)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_10 = (1./n.*sum(y_A.*y_C_10)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);

%% S_j_T

S_1_T = 1 - (1./n.*sum(y_B.*y_C_1)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_2_T = 1 - (1./n.*sum(y_B.*y_C_2)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_3_T = 1 - (1./n.*sum(y_B.*y_C_3)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_4_T = 1 - (1./n.*sum(y_B.*y_C_4)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_5_T = 1 - (1./n.*sum(y_B.*y_C_5)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_6_T = 1 - (1./n.*sum(y_B.*y_C_6)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_7_T = 1 - (1./n.*sum(y_B.*y_C_7)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_8_T = 1 - (1./n.*sum(y_B.*y_C_8)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_9_T = 1 - (1./n.*sum(y_B.*y_C_9)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_10_T = 1 - (1./n.*sum(y_B.*y_C_10)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
