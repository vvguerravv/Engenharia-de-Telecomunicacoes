N=6;
k=0:N-1;
n=0:N-1;
x=[4 3 2 1 0 0];
figure(5)
subplot(211);
stem(n,x)
title('Sinal x[n]');
X=fft(x);
Y=exp(j*2*pi*4*k/6).*X;
y=ifft(Y);
subplot(212);
stem(n,abs(y));
title('Sinal y[n]');
