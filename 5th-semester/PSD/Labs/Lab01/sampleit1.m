function [ms] = sampleit1(t,m,ts)
% SAMPLEIT1 Sample a signal (method 1 is for elementary signals)
% [ms] = sampleit1(t,m,ts)
%
% t: the time vector on which m is defined
% m: the 'analog' signal
% ts: sampling interval for sampling
% ms: the sampled signal
% Sample the signal
ms = interp1(t,m,ts);