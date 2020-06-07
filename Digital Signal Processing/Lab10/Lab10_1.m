F0 = 0;
t0 = 0;
F1 = 100;
t1 = 2;
fi = 0;
Fs = 1000;
t = 0:1/Fs:2;

k = (F1 - F0)/t1;

x = cos((2*pi.*F0.*t) +( 2*pi.*(k/2).*t.*t)+ fi);

x1 = cos((2*pi.*(F0/Fs).*t) +( 2*pi.*(k/2).*t.*t)+ fi);

y = chirp(t,F0,t1,F1,'linear');
figure(1)
plot(t,y)








