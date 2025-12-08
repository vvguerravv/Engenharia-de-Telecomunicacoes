clear all; close all; clc;

%   QUESTÃO 2 – Projeto de Filtros FIR com Janela de Kaiser
%   Filtros: Passa-Baixas, Passa-Altas e Rejeita-Faixa


%% ================================================================
% CASO 1 – FILTRO PASSA-BAIXAS
% Ap = 1 dB
% Ar = 40 dB
% Ωp = 1000 rad/s
% Ωr = 1200 rad/s
% Ωs = 5000 rad/s
%% ================================================================
Ap = 1;
Ar = 40;

Omega_p = 1000;
Omega_r = 1200;
Omega_s = 5000;

% Ripple permitidos
delta_p = (10^(Ap/20) - 1)/(10^(Ap/20) + 1);
delta_r = 10^(-Ar/20);

% Vetores para o kaiserord
F = [Omega_p Omega_r];
A = [1 0];
ripples = [delta_p delta_r];

% Projeto Kaiser
[M, Wn, beta, FILTYPE] = kaiserord(F, A, ripples, Omega_s);

% Janela e filtro
w_kaiser = kaiser(M+1, beta);
h_lp = fir1(M, Wn, FILTYPE, w_kaiser, 'noscale');

% Gráfico
figure;
freqz(h_lp, 1, 2048, Omega_s);
title('CASO 1 – Filtro Passa-Baixas (Kaiser)');
xlabel('\Omega (rad/s)');
ylabel('|H(\Omega)| (dB)');


%% ================================================================
% CASO 2 – FILTRO PASSA-ALTAS
% Ap = 1 dB
% Ar = 40 dB
% Ωr = 1000 rad/s
% Ωp = 1200 rad/s
% Ωs = 5000 rad/s
%% ================================================================
Ap = 1;
Ar = 40;

Omega_r = 1000;
Omega_p = 1200;
Omega_s = 5000;

delta_p = (10^(Ap/20) - 1)/(10^(Ap/20) + 1);
delta_r = 10^(-Ar/20);

F = [Omega_r Omega_p];
A = [0 1];
ripples = [delta_r delta_p];

[M, Wn, beta, FILTYPE] = kaiserord(F, A, ripples, Omega_s);

w_kaiser = kaiser(M+1, beta);
h_hp = fir1(M, Wn, FILTYPE, w_kaiser, 'noscale');

figure;
freqz(h_hp, 1, 2048, Omega_s);
title('CASO 2 – Filtro Passa-Altas (Kaiser)');
xlabel('\Omega (rad/s)');
ylabel('|H(\Omega)| (dB)');


%% ================================================================
% CASO 3 – FILTRO REJEITA-FAIXA
% Ap = 1 dB
% Ar = 80 dB
% Ωr1 = 800 rad/s
% Ωp1 = 1000 rad/s
% Ωp2 = 1400 rad/s
% Ωr2 = 1600 rad/s
% Ωs = 10000 rad/s
%% ================================================================
Ap = 1;
Ar = 80;

Omega_r1 = 800;
Omega_p1 = 1000;
Omega_p2 = 1400;
Omega_r2 = 1600;
Omega_s  = 10000;

% Ripples
delta_p = (10^(Ap/20) - 1) / (10^(Ap/20) + 1);
delta_r = 10^(-Ar/20);

% === Conversão rad/s -> Hz ===
f_r1 = Omega_r1 / (2*pi);
f_p1 = Omega_p1 / (2*pi);
f_p2 = Omega_p2 / (2*pi);
f_r2 = Omega_r2 / (2*pi);
Fs   = Omega_s  / (2*pi);

% === ORDEM CORRETA PARA F (Frequências de borda)
% Passband – Stopband – Stopband – Passband
F = sort([f_p1  f_r1  f_r2  f_p2]);

A = [1 0 1];
ripples = [delta_p delta_r delta_p];

% === Projeto Kaiser ===
[M, Wn, beta, FILTYPE] = kaiserord(F, A, ripples, Fs);

% Janela e filtro
w_kaiser = kaiser(M+1, beta);
h_bs = fir1(M, Wn, 'stop', w_kaiser, 'noscale');

% Plot
figure;
freqz(h_bs, 1, 2048, Fs);
title('CASO 3 – Filtro Rejeita-Faixa (Kaiser)');
xlabel('Frequência (Hz)');
ylabel('|H(f)| (dB)');