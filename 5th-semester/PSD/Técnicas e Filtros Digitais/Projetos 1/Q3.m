clear all; close all; clc;

%% ================================================================
% QUESTÃO 3 – Filtro FIR passa-faixa para eliminar 50 Hz e 900 Hz
% Sinal com componentes: 50 Hz, 300 Hz e 900 Hz
% Deve sobrAr apenas a componente de 300 Hz
% Usar janelas: Retangular, Hamming, Hanning e Blackman
%% ================================================================

%% Parâmetros do sinal
Fs = 2000;          % Frequência de amostragem
Ts = 1/Fs;
tmax = 2;
t = 0:Ts:tmax-Ts;
L = length(t);

% Sinal
s = 5*sin(2*pi*50*t) + 2*sin(2*pi*300*t) + sin(2*pi*900*t);

%% ================================================================
%  PROJETO DO FILTRO PASSA-FAIXA
%  Deve deixar passar apenas a banda contendo 300 Hz
%  Banda desejada: 250 – 750 Hz (do enunciado original)
%% ================================================================

M = 71;                   % Ordem (ímpar → filtro simétrico)
Omega_s = Fs;             % igual ao textbook

Omega_c1 = 250;           % limite inferior da passagem
Omega_c2 = 750;           % limite superior da passagem

wc1 = Omega_c1 * 2*pi / Omega_s;
wc2 = Omega_c2 * 2*pi / Omega_s;

% Índice centrado
n = -(M-1)/2 : (M-1)/2;

% Resposta ideal passa-faixa
h_n = (sin(wc2*n) - sin(wc1*n)) ./ (pi*n);
h_n((M+1)/2) = (wc2 - wc1)/pi;   % corrigir divisão por zero

%% Janelas
w_ret    = ones(1, M);                           % Retangular
w_hamm   = 0.54 + 0.46*cos(2*pi*n/M);            % Hamming
w_hann   = 0.5  + 0.5*cos(2*pi*n/M);             % Hanning
w_black  = 0.42 + 0.5*cos(2*pi*n/M) + 0.08*cos(4*pi*n/M); % Blackman

%% Filtros
h_ret   = h_n .* w_ret;
h_hamm  = h_n .* w_hamm;
h_hann  = h_n .* w_hann;
h_black = h_n .* w_black;

%% ================================================================
% PLOTS DOS FILTROS (em figuras separadas)
%% ================================================================

figure; freqz(h_ret,1,2048,Fs);
title('Filtro FIR passa-faixa – Janela Retangular');

figure; freqz(h_hamm,1,2048,Fs);
title('Filtro FIR passa-faixa – Janela de Hamming');

figure; freqz(h_hann,1,2048,Fs);
title('Filtro FIR passa-faixa – Janela de Hanning');

figure; freqz(h_black,1,2048,Fs);
title('Filtro FIR passa-faixa – Janela de Blackman');

%% ================================================================
%  APLICAÇÃO DOS FILTROS AO SINAL
%% ================================================================

s_ret   = filter(h_ret,1,s);
s_hamm  = filter(h_hamm,1,s);
s_hann  = filter(h_hann,1,s);
s_black = filter(h_black,1,s);

%% ================================================================
% Espectros
%% ================================================================
S = fftshift(abs(fft(s))/L*2);
freq = Fs*(-L/2:L/2-1)/L;

%% Plot do sinal original e filtrado (cada filtro separado)
figure;
subplot(3,1,1); plot(t,s); title('Sinal Original');
xlabel('t'); ylabel('s(t)');

subplot(3,1,2); plot(freq,S); title('Espectro do Sinal Original');
xlabel('f (Hz)'); ylabel('|S(f)|');

subplot(3,1,3); 
S_ret = fftshift(abs(fft(s_ret))/L*2);
plot(freq,S_ret); 
title('Espectro do Sinal Filtrado – Janela Retangular');
xlabel('f (Hz)'); ylabel('|S(f)|');

figure;
S_hamm = fftshift(abs(fft(s_hamm))/L*2);
plot(freq,S_hamm);
title('Espectro – Janela de Hamming');

figure;
S_hann = fftshift(abs(fft(s_hann))/L*2);
plot(freq,S_hann);
title('Espectro – Janela de Hanning');

figure;
S_black = fftshift(abs(fft(s_black))/L*2);
plot(freq,S_black);
title('Espectro – Janela de Blackman');
