function smpl_plot(t,m,ts,it,ms,c)
% SMPL_PLOT Plots the various signals in the sampling process
% smpl_plot(t,m,ts,it,ms)
%
% t: the time vector on which m is defined
% m: the cosine signal
% ts: the time vector of the impulses
% it: the impulse train
% ms: the sampled signal
% c: color (eg. ?r? red, ?g? green)
figure;
% Plot the ?analog? signal
subplot(311);
plot(t,m);
grid on;
lim1 = [-.25 .25 -1.1 1.1];
axis(lim1);
title('Sinal continuo')
% Plot the impulse train
subplot(312);
stem(ts,it,'fill',[c,'^']);
grid on;
lim2 = [-.25 .25 0 1.1];axis(lim2);
title('Trem de impulsos')
% Plot the sampled signal
subplot(313);
idx = find(ms>=0);
stem(ts(idx),ms(idx),'fill',[c,'^']);
hold on;
idx = find(ms <0);
stem(ts(idx),ms(idx),'fill',[c,'v']);
grid on;
axis(lim1);
title('Sinal amostrado')
