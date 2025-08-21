function freq_plot(x,fs,newfs)
% FREQ_PLOT Plots a signal in frequency (fourier) domain
% freq_plot(x,fs,newfs)
%
% x: the signal
% fs: the sampling rate of the ?analog? signal
% newfs: the desired sampling rate
% Default values
if nargin < 3; newfs = fs; end
% Look at the spectrum
X = am_spectrum(x);
% Normalize
X = X/max(X);
f = linspace(-newfs/2,newfs/2,length(x));
plot(f,X);
lim = [-fs/2 fs/2 0 1];
axis(lim);
grid on;