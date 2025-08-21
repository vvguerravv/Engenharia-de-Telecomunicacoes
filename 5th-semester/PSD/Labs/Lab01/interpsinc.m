function y = interpsinc(ms,ts,t)
% INTERPSINC Reconstructs a sampled signal using sinc interpolation
% y = interpsinc(ms,ts,t)
% ms: sampled signal
% ts: sample times
% t: times at which to interpolate ms
% Infer the sampling rate
fs = 1/mean(diff(ts));
% Matrix form of the sinc convolution (hard)
y = sinc((t(:,ones(size(ts))) - ts(:,ones(size(t)))')*fs) * ms;