% definir x1 e x2 segundo leitura do enunciado
% x1(n) não nulo em n=0..3
x1 = [1, -2, -1, 3];       % comprimento 4

% x2 tem valores em n=1,4,5 -> montamos vetor 0..5 (length 6)
x2_lin = [0, 2, 0, 0, -1, 1];   % indices 0..5

% (a) Convolucao circular N = 5
% construir vetores mod 5 (n=0..4)
x1_5 = [1, -2, -1, 3, 0];
x2_5 = [ 1, 2, 0, 0, -1 ];  % note: x2(5) foi somado em x2_5(0)

y_circ5 = cconv(x1_5, x2_5, 5)   % cconv faz convolucao circular de comprimento N

% (b) Menor N para igualar a convolucao linear
Nmin = length(x1) + length(x2_lin) - 1  % deve ser 9
y_lin = conv(x1, x2_lin)                % convolucao linear (length 9)

% (opcional) mostrar ambos lado a lado
disp('circular N=5:'); disp(y_circ5);
disp('linear conv:'); disp(y_lin);

