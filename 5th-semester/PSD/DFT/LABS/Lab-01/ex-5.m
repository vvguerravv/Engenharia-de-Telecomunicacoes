N=10;
n=0:N-1;
x=[1 1 1 1 1 -1 -1 -1 -1 -1];
figure(4)
subplot(311);
stem(n,x)
title('Sinal x[n]');
k=0:N-1;
X=fft(x);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');
