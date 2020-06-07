clear; clc; close all;

audio = "som.wav"; audio_interf = "sominterf.wav";

[y1,Fs1] = audioread(audio);
Y1 = fft(y1)';
wk1 = 2.*pi.*(0:length(y1)-1)/length(y1);
wk1(wk1>pi) = wk1(wk1>pi)-2*pi;
Y1 = [Y1(wk1<0) Y1(wk1>=0)];
wk1 = [wk1(wk1<0) wk1(wk1>=0)];
F1 = (wk1./(2*pi)).*Fs1;

[y2,Fs2] = audioread(audio_interf);
Y2 = fft(y2)';
wk2 = 2.*pi.*(0:length(y2)-1)/length(y2);
wk2(wk2>pi) = wk2(wk2>pi)-2*pi;
Y2 = [Y2(wk2<0) Y2(wk2>=0)];
wk2 = [wk2(wk2<0) wk2(wk2>=0)];
F2 = (wk2./(2*pi)).*Fs2;

figure 
subplot(3,1,1)
plot(F1,abs(Y1))
subplot(3,1,2)
plot(F2,abs(Y2))
subplot(3,1,3)
plot(F2,abs(Y2),'b');hold;
plot(F1,abs(Y1),'r')

% Projetar filtro passa baixa (0-2430Hz)
% Projetar filtro rejeita faixa (880-910Hz)

