function am_plot(idx,m,c,u,rng)
% AM_PLOT Plots the three modulation signals
% am_plot(m,c,u,rng)
%
% idx: x index (it can represent time or frequency)
% m: modulating signal
% c: carrier signal
% u: modulated signal
% rng: range of x axis to plot (optional)
if nargin < 5; rng = 1; end % default value for rng
figure; % create a new figure so we don't overwrite an existing one
subplot(311); % split the figure in three subplots
plot(idx,m); grid on;
axis([rng*min(idx) rng*max(idx) min(m)-0.1 max(m)+0.1]);
title('Espectro do sinal continuo')
subplot(312);
plot(idx,c); grid on;
axis([rng*min(idx) rng*max(idx) min(c)-0.1 max(c)+0.1]);
title('Espectro do sinal reconstruído com a taxa de Nyquist')
subplot(313);
plot(idx,u); grid on;
axis([rng*min(idx) rng*max(idx) min(u)-0.1 max(u)+0.1]);
title('Espectro do sinal reconstruído com a taxa de amostragem')