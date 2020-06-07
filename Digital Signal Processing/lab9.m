clear; clc; close all;

% https://www.mathworks.com/help/signal/ug/fir-filter-design.html
% https://www.mathworks.com/help/signal/ref/fir1.html
% https://www.mathworks.com/help/signal/ref/cheby1.html
% https://www.mathworks.com/help/signal/ref/kaiserord.html
%
%https://www.mathworks.com/help/signal/ref/freqz.html
%
%https://www.mathworks.com/help/matlab/ref/filter.html

%%----------------------
[x,Fs] = audioread('sominterf.wav');
t = ((0:length(x)-1)*(1/Fs))';
%sound(x,Fs);
%plot(t,x);

%%Projeto do filtro FIR
% Filtro Janela
% b = fir1(n,Wn,ftype)
% n = Ordem
% Wn = Frequencia de corte; -> [F1,F2] para passa faixa
% ftype : 'high'      -> passa alta
% ftype : 'low'       -> passa baixa
% ftype : 'bandpass'  -> passa banda
% ftype : 'stop'      -> corta banda


Fs=22050; %frequencia de amostragem

%Filtro 1
FC = [600 1100]; %Frequencia de corte, pode ser vetor para banda
Ordem = 200; %Ordem do filtro, número de termos = ordem + 1
Wc = 2*pi*(FC/Fs);% freq. normalizada
Wn = Wc/pi;%freq entre 0-1 (matlab requirement)
b1 = fir1(Ordem,Wn,'stop');

%Filtro 2
FC = [2000]; %Frequencia de corte, pode ser vetor para banda
Ordem = 50; %Ordem do filtro, número de termos = ordem + 1
Wc = 2*pi*(FC/Fs);% freq. normalizada
Wn = Wc/pi;%freq entre 0-1 (matlab requirement)
b2 = fir1(Ordem,Wn,'low');

%Plot Filter
figure; %Resposta ao impulso
stem([0:length(b1)-1],b1);
[H,F] = freqz(b1,1,1024,'whole',Fs);

figure; % Amplitude -> Freq filtradas
g_hamming=plot(F-Fs/2,fftshift(10*log10(abs(H))),'b','LineWidth',2);
grid;

figure; %Angulo -> Fase
plot(F-Fs/2,fftshift(angle(H)),'b','LineWidth',2);
grid;

%close all;
%Equação de diferenças do filtro representada por termos na var b
% y[0] = b(1)*x[0]+b(2)*x[1]...


%Passando o audio pelo filtro
[x,Fs] = audioread('sominterf.wav');
%sound(x,Fs);
t = ((0:length(x)-1)*(1/Fs))';


%Function filter
%y = filter(b,a,x);
y = filter(b1,1,x);
y = filter(b2,1,y);

X = fft(x)';
Y = fft(y)';
wk = 2.*pi.*(0:length(x)-1)/length(x);
wk(wk>pi) = wk(wk>pi)-2*pi;
X = [X(wk<0) X(wk>=0)];
Y = [Y(wk<0) Y(wk>=0)];
wk = [wk(wk<0) wk(wk>=0)];
F = (wk./(2*pi)).*Fs;

figure;
subplot(211);
plot(F,abs(X));
grid;
xlim([-3000 3000]);
subplot(212);
plot(F,abs(Y));
grid;
xlim([-3000 3000]);

sound(y,Fs);

