close all
clear all
clc

%% Generation of the Sampling Matrix

n = 1e2; % number of samples to be generated
k = 13; % number of input parameters

p = sobolset(2*k,'Skip',1e3,'Leap',1e2); % point set of random numbers generated using Sobol's method
p = scramble(p,'MatousekAffineOwen');

M = net(p,n);

A = M(:,1:k);
B = M(:,(k+1):2*k);

C_1 = B;
C_1(:,1) = A(:,1);
C_2 = B;
C_2(:,2) = A(:,2);
C_3 = B;
C_3(:,3) = A(:,3);
C_4 = B;
C_4(:,4) = A(:,4);
C_5 = B;
C_5(:,5) = A(:,5);
C_6 = B;
C_6(:,6) = A(:,6);
C_7 = B;
C_7(:,7) = A(:,7);
C_8 = B;
C_8(:,8) = A(:,8);
C_9 = B;
C_9(:,9) = A(:,9);
C_10 = B;
C_10(:,10) = A(:,10);
C_11 = B;
C_11(:,11) = A(:,11);
C_12 = B;
C_12(:,12) = A(:,12);
C_13 = B;
C_13(:,13) = A(:,13);


%% Writing Data Into Files

dlmwrite('A.txt',A,'delimiter','\t','precision','%.6d')
dlmwrite('B.txt',B,'delimiter','\t','precision','%.6d')
dlmwrite('C_1.txt',C_1,'delimiter','\t','precision','%.6d')
dlmwrite('C_2.txt',C_2,'delimiter','\t','precision','%.6d')
dlmwrite('C_3.txt',C_3,'delimiter','\t','precision','%.6d')
dlmwrite('C_4.txt',C_4,'delimiter','\t','precision','%.6d')
dlmwrite('C_5.txt',C_5,'delimiter','\t','precision','%.6d')
dlmwrite('C_6.txt',C_6,'delimiter','\t','precision','%.6d')
dlmwrite('C_7.txt',C_7,'delimiter','\t','precision','%.6d')
dlmwrite('C_8.txt',C_8,'delimiter','\t','precision','%.6d')
dlmwrite('C_9.txt',C_9,'delimiter','\t','precision','%.6d')
dlmwrite('C_10.txt',C_10,'delimiter','\t','precision','%.6d')
dlmwrite('C_11.txt',C_11,'delimiter','\t','precision','%.6d')
dlmwrite('C_12.txt',C_12,'delimiter','\t','precision','%.6d')
dlmwrite('C_13.txt',C_13,'delimiter','\t','precision','%.6d')

