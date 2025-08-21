function time_plot(x,sr)
% TIME_PLOT Plots a signal in time
% time_plot(x,sr)
%
% x: the signal
% sr: it?s sampling frequency
% Look at the time signal
t = linspace(0,length(x)/sr,length(x));
plot(t,x);
grid on;
axis tight;
