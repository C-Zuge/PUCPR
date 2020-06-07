clc; clear; close all;

t=[0:0.0001:2];
t1=2;
f0=0;
f1=100;
k=(f1-f0)/t1;
Fs=1000;
xt= cos(2*pi*f0.*t+pi*k.*t.^2);

plot(t,xt)
figure
y = chirp(t, f0, t1, f1,'linear');
plot(t,y)
