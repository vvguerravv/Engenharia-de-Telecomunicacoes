%% ----------------------------------------
% Resposta em frequência do filtro IIR
% Usando os coeficientes do FDATool (Num e Den)
%% ----------------------------------------

Fs = 8000;     % frequência de amostragem do enunciado

% Plota a resposta em frequência
figure;
freqz(Num, Den, 2048, Fs); 
title('Resposta em Frequência do Filtro (IIR)');

% Visualização mais completa
fvtool(Num, Den);   % mostra magnitude, fase, impulso, zeros/polos etc.


%% ----------------------------------------
% Gerar o sinal composto de 770, 852 e 941 Hz
%% ----------------------------------------
t = 0:1/Fs:1-1/Fs;    

x = sin(2*pi*770*t) + ...
    sin(2*pi*852*t) + ...
    sin(2*pi*941*t);

figure;
plot(t(1:500), x(1:500));
title('Sinal de Entrada (primeiros 500 pontos)');
xlabel('Tempo (s)');
ylabel('Amplitude');


%% ----------------------------------------
% Filtrar usando o filtro IIR exportado
%% ----------------------------------------
y = filtfilt(Num, Den, x);   % filtra sem atrasos de fase

figure;
plot(t(1:500), y(1:500));
title('Sinal Filtrado (primeiros 500 pontos)');
xlabel('Tempo (s)');
ylabel('Amplitude');


%% ----------------------------------------
% FFT antes e depois (análise em frequência)
%% ----------------------------------------
NFFT = 4096;
X = abs(fft(x, NFFT));
Y = abs(fft(y, NFFT));

f = (0:NFFT-1)*(Fs/NFFT);

figure;
plot(f(1:NFFT/2), 20*log10(X(1:NFFT/2)));
hold on;
plot(f(1:NFFT/2), 20*log10(Y(1:NFFT/2)));
title('Espectro: Antes vs Depois do Filtro');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
legend('Original','Filtrado');
grid on;


%% ----------------------------------------
% Encontrar largura de banda aproximada (pontos -3 dB)
%% ----------------------------------------
[H, W] = freqz(Num, Den, 4096, Fs);
mag = abs(H);
mag_db = 20*log10(mag + eps);

% pico da banda passante
peak = max(mag);
threshold = peak / sqrt(2);   % -3 dB

idx = find(mag >= threshold); % índices acima de -3 dB
f_low = W(min(idx));
f_high = W(max(idx));

BW = f_high - f_low;

fprintf('\n----- Informações do filtro -----\n');
fprintf('Limite inferior -3 dB: %.2f Hz\n', f_low);
fprintf('Limite superior -3 dB: %.2f Hz\n', f_high);
fprintf('Largura de banda -3 dB: %.2f Hz\n', BW);
