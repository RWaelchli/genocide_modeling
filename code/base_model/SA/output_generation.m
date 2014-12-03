close all
clear all
clc

%% Import of Sample Matrices

M1 = dlmread('M1.txt');
M2 = dlmread('M2.txt');

%% Fixing the Remaining Parameters

N = 40;
max_age = 200;
nIter = 200;
n = size(M1,1);

%% Preallocation of Vectors

% a_0 = zeros(n,1);
% a_1 = zeros(n,1);
% a_2 = zeros(n,1);
a_3 = zeros(n,1);
a_4 = zeros(n,1);
a_5 = zeros(n,1);
a_6 = zeros(n,1);
a_7 = zeros(n,1);
a_8 = zeros(n,1);
a_9 = zeros(n,1);
a_10 = zeros(n,1);
a_12345678910 = zeros(n,1);

%% Model Output Generation

for i = 1:n
%     a_0(i) = fun_model(N,M2(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
%     a_1(i) = fun_model(N,M1(i,1),M2(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
%     a_2(i) = fun_model(N,M2(i,1),M1(i,2),M2(i,3),M2(i,4),M2(i,5),M2(i,6),M2(i,7),M2(i,8),M2(i,9),M2(i,10),max_age,nIter);
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

%% Saving the Output

% dlmwrite('a_0.txt',a_0,'delimiter','\t','precision','%.6d')
% dlmwrite('a_1.txt',a_1,'delimiter','\t','precision','%.6d')
% dlmwrite('a_2.txt',a_2,'delimiter','\t','precision','%.6d')
dlmwrite('a_3.txt',a_3,'delimiter','\t','precision','%.6d')
dlmwrite('a_4.txt',a_4,'delimiter','\t','precision','%.6d')
dlmwrite('a_5.txt',a_5,'delimiter','\t','precision','%.6d')
dlmwrite('a_6.txt',a_6,'delimiter','\t','precision','%.6d')
dlmwrite('a_7.txt',a_7,'delimiter','\t','precision','%.6d')
dlmwrite('a_8.txt',a_8,'delimiter','\t','precision','%.6d')
dlmwrite('a_9.txt',a_9,'delimiter','\t','precision','%.6d')
dlmwrite('a_10.txt',a_10,'delimiter','\t','precision','%.6d')
dlmwrite('a_12345678910.txt',a_12345678910,'delimiter','\t','precision','%.6d')
