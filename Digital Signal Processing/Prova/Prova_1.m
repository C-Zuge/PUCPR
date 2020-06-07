clear; clc; close all;

% Aluno: Cesar Vinicius Zuge
% Prova 2 de PDS 

%--------------------------------------------------------------------------
% A)
Fs = 8000;
F1 = 1000; F2 = 2000; F3 = 3000;

n1 = 0:(Fs*2-1);
n2 = 0:(Fs*3-1);
n3 = 0:(Fs*5-1);
n = 0:(Fs*10-1);

x1 = cos(2*pi*(F1/Fs).*n1);
x2 = cos(2*pi*(F2/Fs).*n2);
x3 = cos(2*pi*(F3/Fs).*n3);
X = [x1 x2 x3];

t = ((0:length(X)-1)*(1/Fs))';

X_fft = fft(X);
wk = 2.*pi.*(0:length(X)-1)/length(X);
wk(wk>pi) = wk(wk>pi)-2*pi;
X_fft = [X_fft(wk<0) X_fft(wk>=0)];
wk = [wk(wk<0) wk(wk>=0)];
F = (wk./(2*pi)).*Fs;

figure(1);
subplot(3,1,1);
plot(t,X);
grid;
subplot(3,1,2);
plot(F,abs(X_fft),'Color','r');
grid;
subplot(3,1,3);
plot(F-Fs/2,fftshift(angle(X_fft)),'b','LineWidth',1);
grid;

%--------------------------------------------------------------------------
% B)
t = 0:1/Fs:10-(1/Fs);
i = cos(2*pi*3500.*t);
y = X+i;

%--------------------------------------------------------------------------
% C)
figure;
spectrogram(y,128,120,128,Fs)

%--------------------------------------------------------------------------
% Prova Parte 2

Ordem = 64; %Ordem do filtro
Fc = 1800;

Wc = 2*pi*(Fc/Fs);% freq. normalizada
Wn = Wc/pi;%freq entre 0-1 (matlab requirement)
win = hamming(Ordem+1);
h = fir1(Ordem,Wn,win,'high');

[H0,F0] = freqz(h,1,1024,'whole',Fs);

win = blackman(Ordem+1);
i = fir1(Ordem,Wn,win,'high');

[H1,F1] = freqz(i,1,1024,'whole',Fs);

%Modulo dft
figure
subplot(2,1,1)
plot(F0-Fs/2,fftshift(10*log10(abs(H0))),'b','LineWidth',2);grid;hold;
plot(F1-Fs/2,fftshift(10*log10(abs(H1))),'r','LineWidth',1);grid;
%Fase dft
subplot(2,1,2)
plot(F0-Fs/2,fftshift(angle(H0)),'b','LineWidth',2);grid;hold;
plot(F1-Fs/2,fftshift(angle(H1)),'r','LineWidth',1);grid

y = filter(i, 1, X);

[H2, F2] = freqz(y,1,1024,'whole',Fs);
figure
subplot(2,1,1)
plot(F2-Fs/2,fftshift(10*log10(abs(H2)))); grid;
subplot(2,1,2)
plot(F1-Fs/2,fftshift((angle(H1)))); grid;

figure
spectrogram(y,128,120,128,Fs);
