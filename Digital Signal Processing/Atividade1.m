clear
close all
clc

N=[];
n=-3;
s=7;
for i = n:1:s
    N = [N i];
end
x1 = [3 0 2 1 5 7 0 0 1 1 10];
subplot(2,2,1)
stem (N,x1)

N=[];
n=0;
s=8;
for i = n:1:s
    N = [N i];
end
x2 = [-4:4];
subplot(2,2,2)
stem (N,x2)

N=[];
n=-3;
s=3;
for i = n:1:s
    N = [N i];
end
x3 = [0 0 0 1 0 0 0];
subplot(2,2,3)
stem (N,x3)

N=[];
n=1;
s=35;
for i = n:1:s
    N = [N i];
end
x4 = ones(1,35);
subplot(2,2,4)
stem (N,x4)
%--------------------------------------------------------------------------
% Exercicio 2
N = 100;
x1=[];
figure
for n = 0:1:N-1
    x1 = [x1 (0.8)^n];
end
subplot(2,2,1)
stem(x1)

N = 50;
x2=[];
for n = 0:1:N-1
    x2 = [x2 (1.5)^n];
end
subplot(2,2,2)
stem(x2)

N = 30;
x3=[];
for n = 0:1:N-1
    x3 = [x3 2*(0.5)^n];
end
subplot(2,2,3)
stem(x3)

N = 200;
x4=[];
for n = 0:1:N-1
    x4 = [x4 0.5*(2)^n];
end
subplot(2,2,4)
stem(x4)
%--------------------------------------------------------------------------
% Exercicio 3

n = 0:50;
x1 = exp((0.5 + j*(pi/6)).*n);

figure
subplot(2,2,1)
stem(n,real(x1))
subplot(2,2,2)
stem(n,imag(x1))
subplot(2,2,3)
stem(n,abs(x1))
subplot(2,2,4)
stem(n,angle(x1))

n = 0:30;
x2 = exp((-0.5 + j*(pi/4)).*n);

figure
subplot(2,2,1)
stem(n,real(x2))
subplot(2,2,2)
stem(n,imag(x2))
subplot(2,2,3)
stem(n,abs(x2))
subplot(2,2,4)
stem(n,angle(x2))

n = 0:100;
x3 = exp((1 + j*(pi/4)).*n);

figure
subplot(2,2,1)
stem(n,real(x3))
subplot(2,2,2)
stem(n,imag(x3))
subplot(2,2,3)
stem(n,abs(x3))
subplot(2,2,4)
stem(n,angle(x3))

n = 0:60;
x4 = exp((0 + j*(pi/6)).*n);

figure
subplot(2,2,1)
stem(n,real(x4))
subplot(2,2,2)
stem(n,imag(x4))
subplot(2,2,3)
stem(n,abs(x4))
subplot(2,2,4)
stem(n,angle(x4))

%--------------------------------------------------------------------------
% Exercício 4

n = 0:40;
x1 = cos(0.*n);
figure
subplot(5,2,1)
stem(n,x1)

x1 = cos(pi/4.*n);
subplot(5,2,2)
stem(n,x1)

x1 = cos(2*pi/4.*n);
subplot(5,2,3)
stem(n,x1)

x1 = cos(3*pi/4.*n);
subplot(5,2,4)
stem(n,x1)

x1 = cos(4*pi/4.*n);
subplot(5,2,5)
stem(n,x1)

x1 = cos(5*pi/4.*n);
subplot(5,2,6)
stem(n,x1)

x1 = cos(6*pi/4.*n);
subplot(5,2,7)
stem(n,x1)

x1 = cos(7*pi/4.*n);
subplot(5,2,8)
stem(n,x1)

x1 = cos(8*pi/4.*n);
subplot(5,2,9)
stem(n,x1)


%--------------------------------------------------------------------------
% Exercício 5

n = -20:20;
x1 = 5*cos(0.5*pi*n+(pi/4)) + 2*sin(0.5*pi*n);
figure
stem(n,x1)

%--------------------------------------------------------------------------
% Exercício 6

n = 0:30;
x1 = cos(n*pi/4); %Periódico
figure
subplot(3,1,1)
stem(n,x1)

x1 = cos(n*3*pi/8); %Periódico
subplot(3,1,2)
stem(n,x1)

x1 = cos(n); % Nao Periódico
subplot(3,1,3)
stem(n,x1)

%--------------------------------------------------------------------------
% Tarefa 2


F = 1000;  T = 1/F;
t=0:Ts:(3*T);
Y1 = cos(2*pi*F*t);
figure(1)
plot(t,Y1);
hold

n=0:8;
figure(2)
Y2 = cos(2.*pi*(F/Fs).*n);
stem(n,Y2)
figure(1)
stem(n.*Ts,Y2,'r')

