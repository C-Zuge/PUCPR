clc; clear; close all;

%EX1
%a)
n1 = -20;
n2 = 20;

n0 = 0;
[x,n]=impseq(n0,n1,n2)

figure
stem(n,x)

%b)
n0 = 4;
[x,n]=impseq(n0,n1,n2)

figure
stem(n,x)

%c)
n0 = -8;
[x,n]=impseq(n0,n1,n2)

figure
stem(n,x)