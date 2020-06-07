% -------------------------------------------------------------------------
% Janela de Truncamento - Tipo Blackman
% -------------------------------------------------------------------------
N=257;
win=blackman(N);
figure(1)
stem([-(N-1)/2:(N-1)/2],win)
[H,w]=freqz(win,1,1024,'whole');
figure(2)
plot(w-pi,fftshift(20*log10(abs(H)))); grid;
        
% -------------------------------------------------------------------------
% Janela de Truncamento - Tipo Hanning
% -------------------------------------------------------------------------

win=hanning(N);
figure(3)
stem([-(N-1)/2:(N-1)/2],win)
[H,w]=freqz(win,1,1024,'whole');
figure(4)
plot(w-pi,fftshift(20*log10(abs(H)))); grid;

% -------------------------------------------------------------------------
% Janela de Truncamento - Tipo Hamming
% -------------------------------------------------------------------------

win=hamming(N);
figure(5)
stem([-(N-1)/2:(N-1)/2],win)
[H,w]=freqz(win,1,1024,'whole');
figure(6)
plot(w-pi,fftshift(20*log10(abs(H)))); grid;

% -------------------------------------------------------------------------
% Janela de Truncamento - Tipo Bartlett
% -------------------------------------------------------------------------

win=bartlett(N);
figure(7)
stem([-(N-1)/2:(N-1)/2],win)
[H,w]=freqz(win,1,1024,'whole');
figure(8)
plot(w-pi,fftshift(20*log10(abs(H)))); grid;

% -------------------------------------------------------------------------
% Janela de Truncamento - Tipo Retangular
% -------------------------------------------------------------------------

win=rectwin(N);
figure(9)   
stem([-(N-1)/2:(N-1)/2],win)
[H,w]=freqz(win,1,1024,'whole');
figure(10)
plot(w-pi,fftshift(20*log10(abs(H)))); grid;


%|
%|            |    Largura do    | Diferença entre as  |
%|   TIPO     |  Lóbulo Principal|      amplitudes     |
%| ___________|__________________|_____________________|
%| retangular |    0.04908       |       13.3          |
%| hanning    |    0.09818       |       31.95         |
%| hamming    |    0.09818       |       44.813        |
%| blackman   |    0.1473        |       58.24         |
%| bartlett   |    0.08389       |       26.79         |






