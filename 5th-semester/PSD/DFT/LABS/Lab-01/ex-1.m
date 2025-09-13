x = [4 3 2 1];
N = length(x);
X = zeros(1,N);
for k = 0:N-1
for n = 0:N-1
X(k+1) = X(k+1) + x(n+1)*exp(-j*2*pi*n*k/N);
end
end
X1=X
X2=fft(x)
