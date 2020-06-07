

% DUAL-TONE MULTIFREQUENCY (DTMF) TONE DETECTION
clear; clc; close all;
fs=8000;
n=0:204;
n1=0:319;
loop=0;
while loop==0,
d=input('Digite Numero:');
symbol=abs(d);
if symbol==1
f1=697; f2=1209;
end
if symbol==2
f1=697; f2=1336;
end
if symbol==3
f1=697; f2=1477;
end
if symbol==4
f1=770; f2=1209;
end
if symbol==5
f1=770; f2=1336;
end
if symbol==6
f1=770; f2=1477;
end
if symbol==7
f1=852; f2=1209;
end
if symbol==8
f1=852; f2=1336;
end
if symbol==9
f1=852; f2=1477;
end
if symbol==0
f1=941; f2=1336;
end
y=sin(2*pi*f1*n1*(1/fs))+sin(2*pi*f2*n1*(1/fs));
sound(y,fs);
x=sin(2*pi*f1*n*(1/fs))+sin(2*pi*f2*n*(1/fs));
k=[18 20 22 24 31 34 38 42];
for m=1:8;
Fx(m)=gfft(x,205,k(m));
val=abs(Fx);
end
stem(k,val); grid;
limit=8100;
if val(1)*val(5)>limit
disp('Tecla Apertada = 1');
end
if val(1)*val(6)>limit
disp('Tecla Apertada = 2');
end
if val(1)*val(7)>limit
disp('Tecla Apertada = 3');
end
if val(2)*val(5)>limit
disp('Tecla Apertada = 4');
end
if val(2)*val(6)>limit
disp('Tecla Apertada = 5');
end
if val(2)*val(7)>limit
disp('Tecla Apertada = 6');
end
if val(3)*val(5)>limit
disp('Tecla Apertada = 7');
end
if val(3)*val(6)>limit
disp('Tecla Apertada = 8');
end
if val(3)*val(7)>limit
disp('Tecla Apertada = 9');
end
if val(4)*val(6)>limit
disp('Tecla Apertada = 0');
end
end