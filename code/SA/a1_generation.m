close all
clear all
clc

tic
%% Importing Data

M1 = dlmread('M1.txt');
M2 = dlmread('M2.txt');

%% Generating the Model Output

N = 40;
max_age = 200;
nIter = 200;
n = size(M1,1);

a_1 = zeros(size(M1,1),1);

for i = 1:n
    a_1(i) = fun_model(N,M1(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
    i
end

dlmwrite('a_1.txt',a_1,'delimiter','\t','precision','%.6d')

toc