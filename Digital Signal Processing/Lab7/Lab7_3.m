    clc; clear; close all;
N=16; % 16  32  128
n=[0:N];
f1=0.22;
f2=0.34;
xn=1/2*sin(2*pi*f1*n)+sin(2*pi*f2*n);

Xn = fft(xn);

subplot(2,1,1);
stem(n,abs(Xn));
subplot(2,1,2);
stem(n,angle(Xn));