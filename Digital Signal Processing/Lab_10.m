clc; clear; close all;

Fs=1000;
F0 = 0; t0=0; F1 = 300; t1 = 2; fi = 0;
t=[t0:1/Fs:t1];

k=(F1-F0)/t1;

X = cos((2*pi.*F0.*t)+(2*pi.*(k/2).*(t.*t)+fi));
Y = chirp(t,F0,t1,F1,'linear');

X_fft = fft(X);
[H,F] = freqz(X,1,1024,'whole',Fs);

figure
g= plot(F-Fs/2,fftshift(10*log(abs(H))),'b','LineWidth',1);

figure
plot(F-Fs/2,fftshift(angle(H)),'b','LineWidth',1);

% figure
% plot(t,X)
% 
% figure
% plot(t,X_fft)
figure
spectrogram(X,128,120,128,Fs)