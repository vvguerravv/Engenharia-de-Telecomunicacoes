% Questao 1 - Filtros passa-faixa (Hamming, Hanning, Blackman)

clear; close all; clc;

% Especificacoes
M_vals = [10, 100, 1000];   % valores solicitados
Omega_c1 = 10;              % rad/s
Omega_c2 = 35;              % rad/s
Omega_s  = 100;             % rad/s (frequência de amostragem angular)

% converter frequências analógicas para digitais (rad/amostra)
wc1 = Omega_c1 * 2*pi / Omega_s;
wc2 = Omega_c2 * 2*pi / Omega_s;

Nfft = 2048;

for idx = 1:length(M_vals)
    
    N = M_vals(idx);        % valor de M
    L = N + 1;              % número de coeficientes
    
    % índice simétrico
    n = -N/2 : N/2;
    
    % resposta ao impulso ideal do passa-faixa
    h_ideal = zeros(1, L);
    for k = 1:L
        ni = n(k);
        if ni == 0
            h_ideal(k) = (wc2 - wc1) / pi;
        else
            h_ideal(k) = (sin(wc2*ni) - sin(wc1*ni)) / (pi*ni);
        end
    end
    
    % janelas
    w_ham   = hamming(L)';
    w_hann  = hann(L)';
    w_black = blackman(L)';
    
    % aplicar janelas
    h_hamm  = h_ideal .* w_ham;
    h_hann  = h_ideal .* w_hann;
    h_black = h_ideal .* w_black;
    
    % resposta em frequência (rad/amostra)
    [H_ham,  w] = freqz(h_hamm , 1, Nfft);
    [H_hann, ~] = freqz(h_hann , 1, Nfft);
    [H_black,~] = freqz(h_black, 1, Nfft);

    % converter rad/amostra -> rad/s
    w_phys = w * (Omega_s/(2*pi));

    % ========= PLOTS ==========
    figure;
    
    subplot(3,1,1)
    plot(w_phys, 20*log10(abs(H_ham)));
    axis([0 Omega_s/2 -100 10])
    title(sprintf('Janela de Hamming — M = %d', N))
    xlabel('Frequência (rad/s)'); ylabel('Magnitude (dB)')
    
    subplot(3,1,2)
    plot(w_phys, 20*log10(abs(H_hann)));
    axis([0 Omega_s/2 -100 10])
    title('Janela de Hanning')
    xlabel('Frequência (rad/s)'); ylabel('Magnitude (dB)')
    
    subplot(3,1,3)
    plot(w_phys, 20*log10(abs(H_black)));
    axis([0 Omega_s/2 -100 10])
    title('Janela de Blackman')
    xlabel('Frequência (rad/s)'); ylabel('Magnitude (dB)')
    
end
