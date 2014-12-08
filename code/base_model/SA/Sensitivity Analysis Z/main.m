close all
clear all
clc

tic

%% Bounds of the Investigated Parameters
a_0 = importdata('a_0.txt');
a_1 = importdata('a_1.txt');
a_2 = importdata('a_2.txt');
a_3 = importdata('a_3.txt');
a_4 = importdata('a_4.txt');
a_5 = importdata('a_5.txt');
a_6 = importdata('a_6.txt');
a_7 = importdata('a_7.txt');
a_8 = importdata('a_8.txt');
a_9 = importdata('a_9.txt');
a_10 = importdata('a_10.txt');
a_12345678910 = importdata('a_12345678910.txt');

n = size(a_0,1);

E2 = 1/n*sum(a_12345678910.*a_0);
V = 1/n*sum((a_0-sqrt(E2)).^2);

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

S_1 = (U_1-E2)/V;
S_2 = (U_2-E2)/V;
S_3 = (U_3-E2)/V;
S_4 = (U_4-E2)/V;
S_5 = (U_5-E2)/V;
S_6 = (U_6-E2)/V;
S_7 = (U_7-E2)/V;
S_8 = (U_8-E2)/V;
S_9 = (U_9-E2)/V;
S_10 = (U_10-E2)/V;

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

S_1T = 1-(U_min1-E2)/V;
S_2T = 1-(U_min2-E2)/V;
S_3T = 1-(U_min3-E2)/V;
S_4T = 1-(U_min4-E2)/V;
S_5T = 1-(U_min5-E2)/V;
S_6T = 1-(U_min6-E2)/V;
S_7T = 1-(U_min7-E2)/V;
S_8T = 1-(U_min8-E2)/V;
S_9T = 1-(U_min9-E2)/V;
S_10T = 1-(U_min10-E2)/V;

toc
