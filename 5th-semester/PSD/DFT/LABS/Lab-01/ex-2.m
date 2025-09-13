N=5;
n=0:N-1;
x=[1 0 0 0 0];
figure(1)
subplot(311);
stem(n,x)
title('Sinal x[n] - impulso');
k=0:N-1;
X=fft(x);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');
