XC = fft(x_clean);
L=length(XC);
XC = abs(2*XC/L);
XC=fftshift(XC);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,XC)
axis([-100 100 -1 6])
