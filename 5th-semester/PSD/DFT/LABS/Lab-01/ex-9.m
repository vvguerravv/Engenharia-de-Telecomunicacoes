N=10;
n=0:N-1;
x=[1 1 1 1 1 1 0 0 0 0];
figure(8)
subplot(211);
stem(n,x);
title('Sinal x[n]');
X=fft(x);
Y=X.*conj(X);
y=ifft(Y);
subplot(212);
stem(n,y);
title('Sinal y[n]');
