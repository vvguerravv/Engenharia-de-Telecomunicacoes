%% -----------------------------------------------------
% Resposta em frequência do Filtro Chebyshev Tipo I
% (Usando Num_cheby1 e Den_cheby1 vindos do FDATool)
%% -----------------------------------------------------

Fs = 8000;

figure;
freqz(Num_cheby1, Den_cheby1, 2048, Fs);
title('Resposta em Frequência - Chebyshev Tipo I');

fvtool(Num_cheby1, Den_cheby1);  % Ferramenta completa de análise


%% -----------------------------------------------------
% Gerar sinal de teste (770 + 852 + 941 Hz)
%% -----------------------------------------------------
t = 0:1/Fs:1-1/Fs;

x = sin(2*pi*770*t) + ...
    sin(2*pi*852*t) + ...
    sin(2*pi*941*t);

figure;
plot(t(1:500), x(1:500));
title('Sinal original (primeiros 500 pontos)');
xlabel('Tempo (s)');
ylabel('Amplitude');


%% -----------------------------------------------------
% Aplicar o filtro Chebyshev I
%% -----------------------------------------------------
y = filtfilt(Num_cheby1, Den_cheby1, x);

figure;
plot(t(1:500), y(1:500));
title('Sinal filtrado - Chebyshev Tipo I');
xlabel('Tempo (s)');
ylabel('Amplitude');


%% -----------------------------------------------------
% FFT antes e depois
%% -----------------------------------------------------
NFFT = 4096;
X = abs(fft(x, NFFT));
Y = abs(fft(y, NFFT));

f = (0:NFFT-1)*(Fs/NFFT);

figure;
plot(f(1:NFFT/2), 20*log10(X(1:NFFT/2)));
hold on;
plot(f(1:NFFT/2), 20*log10(Y(1:NFFT/2)));
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
title('Espectro antes e depois - Chebyshev Tipo I');
legend('Original', 'Filtrado');
grid on;


%% -----------------------------------------------------
% Largura de banda aproximada (-3 dB)
%% -----------------------------------------------------
[H, W] = freqz(Num_cheby1, Den_cheby1, 4096, Fs);
mag = abs(H);
peak = max(mag);

threshold = peak / sqrt(2);   % -3 dB

idx = find(mag >= threshold);
f_low = W(min(idx));
f_high = W(max(idx));
BW = f_high - f_low;

fprintf('\n----- Chebyshev Tipo I -----\n');
fprintf('Faixa -3 dB = %.2f Hz a %.2f Hz\n', f_low, f_high);
fprintf('Largura de banda = %.2f Hz\n', BW);
