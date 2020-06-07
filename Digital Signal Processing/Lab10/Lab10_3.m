
%3)
clc; clear; close all;

n=[0:2000];
t1=2;
f0=0;
f1=100;
k=(f1-f0)/t1;
Fs=1000;
t = [0:1/1000:2];
xn= cos((2*pi*f0.*t)+pi*k.*t.^2);
Xn = fft(xn);

k=[0:length(Xn)-1];
wk=2*pi.*k/length(Xn);


for c = 1:length(wk)
    if(wk(c)> pi)
        wk(c) = wk(c)-2*pi;
    end
end
F=wk./(2*pi)*Fs;
plot(t,xn)
figure
subplot(2,1,1);
plot(F,abs(Xn));
subplot(2,1,2);
plot(F,angle(Xn));