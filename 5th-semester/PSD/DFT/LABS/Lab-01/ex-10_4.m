N=10;
b = ones(1,N);
y2 = conv(x_noisy,b/N);
y1 = filter(b,N,x_noisy);
Y = fft(y2);
L=length(Y);
Y = abs(2*Y/L);
Y=fftshift(Y);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,Y)
axis([-100 100 -1 6])
