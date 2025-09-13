XN = fft(x_noisy);
XN = abs(2*XN/L);
XN=fftshift(XN);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,XN)
axis([-100 100 -1 6])
