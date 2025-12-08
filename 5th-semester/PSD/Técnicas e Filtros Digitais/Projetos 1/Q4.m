%% QUESTÃO 4 – Projeto de 3 filtros passa-faixa com Kaiser
clear; close all; clc;

%% Sinal
Fs = 8000;  
t = 0:1/Fs:1-1/Fs;
s = sin(2*pi*770*t) + sin(2*pi*852*t) + sin(2*pi*941*t);

%% Ripple specifications
Ap = 1;   
Ar = 60;  

delta_p = (10^(Ap/20)-1)/(10^(Ap/20)+1);
delta_r = 10^(-Ar/20);

%% =====================================================
% FILTRO 1 – Passa 770 Hz
% Rejeita: 697 e 852 Hz
%% =====================================================

stop1 = 697;
pass1 = 740;
pass2 = 800;
stop2 = 852;

F1 = [stop1 pass1 pass2 stop2];
A1 = [0 1 0];
r1 = [delta_r delta_p delta_r];

[M1, Wn1, beta1, type1] = kaiserord(F1, A1, r1, Fs);
h1 = fir1(M1, Wn1, 'bandpass', kaiser(M1+1, beta1));

figure; freqz(h1,1,2048,Fs);
title('Filtro 1 – Passa 770 Hz');

%% =====================================================
% FILTRO 2 – Passa 852 Hz
% Rejeita: 770 e 941 Hz
%% =====================================================

stop1 = 770;
pass1 = 820;
pass2 = 900;
stop2 = 941;

F2 = [stop1 pass1 pass2 stop2];
A2 = [0 1 0];
r2 = [delta_r delta_p delta_r];

[M2, Wn2, beta2, type2] = kaiserord(F2, A2, r2, Fs);
h2 = fir1(M2, Wn2, 'bandpass', kaiser(M2+1, beta2));

figure; freqz(h2,1,2048,Fs);
title('Filtro 2 – Passa 852 Hz');


%% =====================================================
% FILTRO 3 – Passa 941 Hz
% Rejeita: 852 e 1209 Hz
%% =====================================================

stop1 = 852;
pass1 = 900;
pass2 = 980;
stop2 = 1209;

F3 = [stop1 pass1 pass2 stop2];
A3 = [0 1 0];
r3 = [delta_r delta_p delta_r];

[M3, Wn3, beta3, type3] = kaiserord(F3, A3, r3, Fs);
h3 = fir1(M3, Wn3, 'bandpass', kaiser(M3+1, beta3));

figure; freqz(h3,1,2048,Fs);
title('Filtro 3 – Passa 941 Hz');


%% Filtrando os sinais
y1 = filter(h1,1,s);
y2 = filter(h2,1,s);
y3 = filter(h3,1,s);

%% FFT para espectros
N = length(s);
faxis = linspace(0,Fs/2,N/2);

S  = fft(s);
Y1 = fft(y1);
Y2 = fft(y2);
Y3 = fft(y3);

%% Espectro sinal original
figure;
plot(faxis, abs(S(1:N/2)));
title('Espectro do sinal original');
xlabel('Frequência (Hz)'); ylabel('|S(f)|');

%% Espectros filtrados
figure;
plot(faxis, abs(Y1(1:N/2)));
title('Espectro – Saída Filtro 1 (770 Hz)');

figure;
plot(faxis, abs(Y2(1:N/2)));
title('Espectro – Saída Filtro 2 (852 Hz)');

figure;
plot(faxis, abs(Y3(1:N/2)));
title('Espectro – Saída Filtro 3 (941 Hz)');
