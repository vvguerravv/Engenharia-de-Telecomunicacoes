x = [4 1 2 2];       % x[0], x[1], x[2], x[3]

% (a) DFT de 4 pontos
X = fft(x,4);

% exibir X
disp('X = '); disp(X);

% (b) convolucao circular de 4 pontos (direta)
y_circ = zeros(1,4);
for n=0:3
    s = 0;
    for m=0:3
        s = s + x(m+1)*x(mod(n-m,4)+1);
    end
    y_circ(n+1) = s;
end
disp('y circular (direta) = '); disp(y_circ);

% (c) via DFT
Y = X .* X;
y_ifft = ifft(Y,4);
disp('y via DFT/IDFT = '); disp(round(y_ifft));   % round para remover erros numéricos

% (d) convolucao linear e N minimo
y_lin = conv(x,x);   % length 7
disp('y linear = '); disp(y_lin);
% N minimo = length(y_lin) = 7
