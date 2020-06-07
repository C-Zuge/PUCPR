%LAB 7 Ex01
clear; clc; close all;

fs=8000;
n=0:204;

f=[697 770 852 941 1209 1336 1447 1633];
escala=[[10 25];[10 25];[15 30];[15 30];[25 40];[25 40];[35 50];[35 50]];
for i=1:8
figure(i);
x=sin(2*pi*f(i)*n*(1/fs));
X=fft(x);
stem(n,abs(X));
label=num2str(f(i));
title(strcat(label,'Hz'));
ylabel('|X[k]|');
xlabel('n');
axis([escala(i,1) escala(i,2) 0 110]);
end
