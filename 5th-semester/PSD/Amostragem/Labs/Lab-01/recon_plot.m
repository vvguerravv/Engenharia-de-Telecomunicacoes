function recon_plot(t,m,ts,ms,mr,c)
% RECON_PLOT Plots original against reconstructed
% recon_plot(t,m,ts,ms,mr,c)
%
% t: the time vector on which m is defined
% m: the cosine signal
% ts: the time vector of the impulses
% ms: the sampled signal
% mr: the reconstructed signal
% c: color (eg. 'r' red, 'g' green)
figure;
lim1 = [-.25 .25 -1.1 1.1];
lim2 = [-.25 .25 0 1.1];
subplot(311);
plot(t,m);
grid on;axis(lim1);
title('Sinal continuo')
subplot(312);
idx = find(ms >= 0);
stem(ts(idx),ms(idx),'fill',[c,'^']);
hold on;
idx = find(ms < 0);
stem(ts(idx),ms(idx),'fill',[c,'v']);
grid on;
axis(lim1);
title('Sinal amostrado')
subplot(313);
plot(t,mr,c);
grid on;
axis(lim1);
title('Sinal reconstruído')