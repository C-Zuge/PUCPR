clear; clc; close all

Fs = 8000; Ts=1/Fs;
F1 = 1000; F2 = 1500; F3 = 2000; 

% Sinal 1
n=[0:Fs*6];
X1 = cos(2.*pi.*(F1/Fs).*n);
X2 = cos(2.*pi.*(F2/Fs).*n);
X3 = cos(2.*pi.*(F3/Fs).*n);
X = X1+X2+X3;
% Calcula Espectro do Sinal 1
[H,F] = freqz(X,1,1024,'whole',Fs);
figure
g_hamming = plot(F-Fs/2,fftshift(10*log(abs(H))),'b','LineWidth',1);
grid
xlabel('F(Hz)');
title('Filtro FIR - N=17');hold;
figure
plot(F-Fs/2,fftshift(angle(H)),'b','LineWidth',1);

% Sinal 2
n=[0:Fs*2];
Y1 = cos(2.*pi.*(F1/Fs).*n);
Y2 = cos(2.*pi.*(F2/Fs).*n);
Y3 = cos(2.*pi.*(F3/Fs).*n);
Y = [Y1 Y2 Y3];
% Calcula Espectro do Sinal 2
[H,F] = freqz(Y,1,1024,'whole',Fs);
figure
g_hamming = plot(F-Fs/2,fftshift(10*log(abs(H))),'b','LineWidth',1);
grid
xlabel('F(Hz)');
title('Filtro FIR - N=17');hold;
figure
plot(F-Fs/2,fftshift(angle(H)),'b','LineWidth',1);


