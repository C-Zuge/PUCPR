clear; clc; close all;

Fs=16000; % Frequencia de Amostragem
Fc=[4000 4010]; % Frequencia de Corte
Ordem=16; % Ordem do Filtro
wc=2*pi.*Fc/Fs; % Calculo da Frequencia Normalizada (0 - pi)
wn=wc./pi; % Calculo da Frequencia Normalizada para comando "fir1" (0 - 1)

% Projeto Filtro FIR Passa Baixa
% Calculo da Resposta ao Impulso h[n]
h=fir1(Ordem,wn,'stop');

% Calcula a Resposta em Freqüência do Filtro (DFT/FFT)
[H,F]=freqz(h,1,1024,'whole',Fs);

% Grafico da Resposta em Modulo
figure(1);
plot(F-(Fs/2),fftshift(10*log10(abs(H)))); grid;

% Grafico da Resposta em Fase
figure(2);
plot(F-(Fs/2),fftshift(angle(H))); grid;