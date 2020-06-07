clc; clear; close all;

n0 = 0;
n1 = -20;
n2 = 20;
[x,n] = impseq(n0,n1,n2);
figure
stem(n,x)
hold on


n0 = 4;
n1 = -20;
n2 = 20;
[x,n] = impseq(n0,n1,n2);
stem(n,x)
hold on

n0 = -8;
n1 = -20;
n2 = 20;
[x,n] = impseq(n0,n1,n2);
stem(n,x)

%--------------------------------------------------------------------------

n0 = 0;
n1 = -20;
n2 = 20;

[x,n] = stepseq(n0,n1,n2);
figure
stem(n,x)
hold on

n0 = 4;
n1 = -20;
n2 = 20;
[x,n] = stepseq(n0,n1,n2);
figure
stem(n,x)
hold on

n0 = -5;
n1 = -20;
n2 = 20;
[x,n] = stepseq(n0,n1,n2);
figure
stem(n,x)

%--------------------------------------------------------------------------
 
 x1=[3 0 2 1 5 7 0 0 1 1 10];
 n1=[-3 -2 -1 0 1 2 3 4 5 6 7];
 x2=[-4 -3 -2 -1 0 1 2 3 4];
 n2=[0 1 2 3 4 5 6 7 8 9];
 
 [y,n]=sigadd(x1,n1,x2,n2);
 figure
 stem(n,y)
 
 [y,n]=sigmult(x1,n1,x2,n2);
 figure
 stem(n,y)
 
%--------------------------------------------------------------------------

n = -2:10;
x = [1:7,6:-1:1];
[x11,n11] = sigshift(x,n,5);
[x12,n12] = sigshift(x,n,-4);
[x1,n1] = sigadd(2*x11,n11,-3*x12,n12);
figure
subplot(2,1,1);
stem(n1,x1);





