clc; clear; close all;

%EX2

%a)
n1 = -20;
n2 = 20;

n0 = 0;
[x,n] = stepseq(n0,n1,n2)

figure
stem(n,x)

%b)
n0 = 