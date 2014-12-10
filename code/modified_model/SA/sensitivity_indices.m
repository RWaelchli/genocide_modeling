close all
clear all
clc

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
y_C_11 = dlmread('y_C_11.txt');
y_C_12 = dlmread('y_C_12.txt');
y_C_13 = dlmread('y_C_13.txt');

n = length(y_A);

%% f_0

f_0_2 = (1/n.*sum(y_A))^2;

%% S_i

S = zeros(13,1);

S(1) = (1./n.*sum(y_A.*y_C_1)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(2) = (1./n.*sum(y_A.*y_C_2)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(3) = (1./n.*sum(y_A.*y_C_3)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(4) = (1./n.*sum(y_A.*y_C_4)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(5) = (1./n.*sum(y_A.*y_C_5)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(6) = (1./n.*sum(y_A.*y_C_6)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(7) = (1./n.*sum(y_A.*y_C_7)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(8) = (1./n.*sum(y_A.*y_C_8)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(9) = (1./n.*sum(y_A.*y_C_9)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(10) = (1./n.*sum(y_A.*y_C_10)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(11) = (1./n.*sum(y_A.*y_C_11)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(12) = (1./n.*sum(y_A.*y_C_12)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S(13) = (1./n.*sum(y_A.*y_C_13)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);

%% S_i^T

S_T = zeros(13,1);

S_T(1) = 1 - (1./n.*sum(y_B.*y_C_1)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(2) = 1 - (1./n.*sum(y_B.*y_C_2)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(3) = 1 - (1./n.*sum(y_B.*y_C_3)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(4) = 1 - (1./n.*sum(y_B.*y_C_4)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(5) = 1 - (1./n.*sum(y_B.*y_C_5)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(6) = 1 - (1./n.*sum(y_B.*y_C_6)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(7) = 1 - (1./n.*sum(y_B.*y_C_7)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(8) = 1 - (1./n.*sum(y_B.*y_C_8)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(9) = 1 - (1./n.*sum(y_B.*y_C_9)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(10) = 1 - (1./n.*sum(y_B.*y_C_10)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(11) = 1 - (1./n.*sum(y_B.*y_C_11)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(12) = 1 - (1./n.*sum(y_B.*y_C_12)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
S_T(13) = 1 - (1./n.*sum(y_B.*y_C_13)-f_0_2)./(1./n.*sum(y_A.^2)-f_0_2);
