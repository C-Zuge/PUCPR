clc; clear; close all;

t1=2;
f0=0;
f1=100;
k=(f1-f0)/t1;
Fs=1000;
t = [0:1/1000:2];
xt= cos((2*pi*f0.*t)+pi*k.*t.^2);






window=128;
noverlap=120;
nfft=128;

spectrogram(xt, window, noverlap, nfft, Fs)