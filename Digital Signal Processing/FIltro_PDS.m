clear; clc; close all

Fs=16000;%frequencia de amostragem
Fc1=2000;
Fc2=3000;

M=32; N=2*M+1; Ordem = N-1; %Ordem do filtro

Wc1 = 2*pi*(Fc1/Fs);% freq. normalizada
Wn1 = Wc1/pi;%freq entre 0-1 (matlab requirement)
% Wc2 = 2*pi*(Fc2/Fs);% freq. normalizada
% Wn2 = Wc2/pi;%freq entre 0-1 (matlab requirement)

%Wn = [Wn1,Wn2];
%h = fir1(Ordem,Wn); %Passa Baixa
h = fir1(Ordem,Wn1,'high'); %Passa Alta
%h = fir1(Ordem,Wn); %Passa Faixa Wn como vetor
%h = fir1(Ordem,Wn,'stop'); %Rejeita Faixa Wn como vetor

figure
stem([0:length(h)-1],h)%Resposta ao impulso 

[H,F] = freqz(h,1,1024,'whole',Fs);

figure
%Modulo dft
g_hamming=plot(F-Fs/2,fftshift(10*log10(abs(H))),'b','LineWidth',2);grid;
figure
%Fase dft
plot(F-Fs/2,fftshift(angle(H)),'b','LineWidth',2);grid;
