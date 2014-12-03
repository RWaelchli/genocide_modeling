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

a_12345678910 = zeros(size(M1,1),1);

for i = 1:n
    a_12345678910(i) = fun_model(N,M1(i,1),M1(i,2),M1(i,3),M1(i,4),M1(i,5),M1(i,6),M1(i,7),M1(i,8),M1(i,9),M1(i,10),max_age,nIter);
    i
end

dlmwrite('a_12345678910.txt',a_12345678910,'delimiter','\t','precision','%.6d')

toc