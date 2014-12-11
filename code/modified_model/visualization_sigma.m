close all;
clear all;
clc;

%% Generation Probability Density Objects

pd_L = makedist('Normal','mu',0.8,'sigma',0.1);
t_L = truncate(pd_L,0,1);
pd_T = makedist('Normal','mu',0.1,'sigma',0.1);
t_T = truncate(pd_T,-1,1);

n = 1000;
L = random(t_L,n,1);
T = random(t_T,n,1);

f1 = figure(1);
hist(L)
xlim([0 1])

f2 = figure(2);
hist(T)
xlim([-1 1])