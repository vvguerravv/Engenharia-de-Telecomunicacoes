N=50;
n=0:N-1;
x=ones(1,N);
figure(2)
subplot(311);
stem(n,x)
title('Sinal x[n] - constante');
k=0:N-1;
X=fft(x,N);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');
