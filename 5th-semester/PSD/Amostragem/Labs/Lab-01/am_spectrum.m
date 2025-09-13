function X = am_spectrum(x)
% AM_SPECTRUM Calculates the spectrum of a signal %
% X = am_spectrum(x)
%
% x: signal
% X: spectrum of signal x
X = abs(fftshift(fft(x)));
