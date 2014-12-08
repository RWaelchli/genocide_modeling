close all
clear all
clc

%% Import of Sample Matrices

A = dlmread('A.txt');
B = dlmread('B.txt');
C_1 = dlmread('C_1.txt');
C_2 = dlmread('C_2.txt');
C_3 = dlmread('C_3.txt');
C_4 = dlmread('C_4.txt');
C_5 = dlmread('C_5.txt');
C_6 = dlmread('C_6.txt');
C_7 = dlmread('C_7.txt');
C_8 = dlmread('C_8.txt');
C_9 = dlmread('C_9.txt');
C_10 = dlmread('C_10.txt');

%% Fixing the Remaining Parameters

N = 40;
max_age = 200;
nIter = 200;
n = size(A,1);

%% Preallocation of Vectors

y_A = zeros(n,1);
y_B = zeros(n,1);
y_C_1 = zeros(n,1);
y_C_2 = zeros(n,1);
y_C_3 = zeros(n,1);
y_C_4 = zeros(n,1);
y_C_5 = zeros(n,1);
y_C_6 = zeros(n,1);
y_C_7 = zeros(n,1);
y_C_8 = zeros(n,1);
y_C_9 = zeros(n,1);
y_C_10 = zeros(n,1);

%% Model Output Generation

for i = 1:n
    y_A(i) = fun_model(N,A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,6),A(i,7),A(i,8),A(i,9),A(i,10),max_age,nIter);
    y_B(i) = fun_model(N,B(i,1),B(i,2),B(i,3),B(i,4),B(i,5),B(i,6),B(i,7),B(i,8),B(i,9),B(i,10),max_age,nIter);
    y_C_1(i) = fun_model(N,C_1(i,1),C_1(i,2),C_1(i,3),C_1(i,4),C_1(i,5),C_1(i,6),C_1(i,7),C_1(i,8),C_1(i,9),C_1(i,10),max_age,nIter);
    y_C_2(i) = fun_model(N,C_2(i,1),C_2(i,2),C_2(i,3),C_2(i,4),C_2(i,5),C_2(i,6),C_2(i,7),C_2(i,8),C_2(i,9),C_2(i,10),max_age,nIter);
    y_C_3(i) = fun_model(N,C_3(i,1),C_3(i,2),C_3(i,3),C_3(i,4),C_3(i,5),C_3(i,6),C_3(i,7),C_3(i,8),C_3(i,9),C_3(i,10),max_age,nIter);
    y_C_4(i) = fun_model(N,C_4(i,1),C_4(i,2),C_4(i,3),C_4(i,4),C_4(i,5),C_4(i,6),C_4(i,7),C_4(i,8),C_4(i,9),C_4(i,10),max_age,nIter);
    y_C_5(i) = fun_model(N,C_5(i,1),C_5(i,2),C_5(i,3),C_5(i,4),C_5(i,5),C_5(i,6),C_5(i,7),C_5(i,8),C_5(i,9),C_5(i,10),max_age,nIter);
    y_C_6(i) = fun_model(N,C_6(i,1),C_6(i,2),C_6(i,3),C_6(i,4),C_6(i,5),C_6(i,6),C_6(i,7),C_6(i,8),C_6(i,9),C_6(i,10),max_age,nIter);
    y_C_7(i) = fun_model(N,C_7(i,1),C_7(i,2),C_7(i,3),C_7(i,4),C_7(i,5),C_7(i,6),C_7(i,7),C_7(i,8),C_7(i,9),C_7(i,10),max_age,nIter);
    y_C_8(i) = fun_model(N,C_8(i,1),C_8(i,2),C_8(i,3),C_8(i,4),C_8(i,5),C_8(i,6),C_8(i,7),C_8(i,8),C_8(i,9),C_8(i,10),max_age,nIter);
    y_C_9(i) = fun_model(N,C_9(i,1),C_9(i,2),C_9(i,3),C_9(i,4),C_9(i,5),C_9(i,6),C_9(i,7),C_9(i,8),C_9(i,9),C_9(i,10),max_age,nIter);
    y_C_10(i) = fun_model(N,C_10(i,1),C_10(i,2),C_10(i,3),C_10(i,4),C_10(i,5),C_10(i,6),C_10(i,7),C_10(i,8),C_10(i,9),C_10(i,10),max_age,nIter);
    i
end

%% Saving the Output

dlmwrite('y_A.txt',y_A,'delimiter','\t','precision','%.6d')
dlmwrite('y_B.txt',y_B,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_1.txt',y_C_1,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_2.txt',y_C_2,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_3.txt',y_C_3,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_4.txt',y_C_4,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_5.txt',y_C_5,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_6.txt',y_C_6,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_7.txt',y_C_7,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_8.txt',y_C_8,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_9.txt',y_C_9,'delimiter','\t','precision','%.6d')
dlmwrite('y_C_10.txt',y_C_10,'delimiter','\t','precision','%.6d')
