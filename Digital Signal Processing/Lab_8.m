clear; clc; close all;

[x,Fs] = audioread('som.wav');

t = ((0:length(x)-1)*(1/Fs))';

X = fft(x)';
wk = 2.*pi.*(0:length(x)-1)/length(x);
wk(wk>pi) = wk(wk>pi)-2*pi;
X = [X(wk<0) X(wk>=0)];
wk = [wk(wk<0) wk(wk>=0)];
F = (wk./(2*pi)).*Fs;

figure(1);
subplot(2,1,1);
plot(t,x,'--','Color','b');
hold on;
subplot(2,1,2);
stem(F,abs(X),'--','Color','b');
hold on;

%COM INTERFERENCIA

[x,Fs] = audioread('sominterf.wav');

t = ((0:length(x)-1)*(1/Fs))';

X = fft(x)';
wk = 2.*pi.*(0:length(x)-1)/length(x);
wk(wk>pi) = wk(wk>pi)-2*pi;
X = [X(wk<0) X(wk>=0)];
wk = [wk(wk<0) wk(wk>=0)];
F = (wk./(2*pi)).*Fs;

subplot(2,1,1);
plot(t,x,'Color','c');
subplot(2,1,2);
plot(F,abs(X),'Color','r');

%Freq. Interferentes 900Hz e 2500Hz



[x,Fs] = audioread('som.wav');
t = ((0:length(x)-1)*(1/Fs))';

F1 = 0.25*cos((2*pi*1100).*t);
F2 = 0.50*cos((2*pi*1300).*t);
F3 = 0.25*cos((2*pi*1900).*t);
x = x+F1+F2+F3;

X = fft(x)';
wk = 2.*pi.*(0:length(x)-1)/length(x);
wk(wk>pi) = wk(wk>pi)-2*pi;
X = [X(wk<0) X(wk>=0)];
wk = [wk(wk<0) wk(wk>=0)];
F = (wk./(2*pi)).*Fs;

figure(2);
subplot(2,1,1);
plot(t,x,'Color','m');
hold on;
subplot(2,1,2);
plot(F,abs(X),'Color','b');
hold on;