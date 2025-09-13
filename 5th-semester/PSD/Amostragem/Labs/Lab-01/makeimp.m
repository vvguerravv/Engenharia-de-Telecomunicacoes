function [it, ts] = makeimp(fs, len)

% MAKEIMP makes an impulse train for sampling
% [it, ts] = makeimp(fs, N)
% 
% fs: frequency of the impulse train (sampling frequency)
% len: lenght in seconds 
% it: the impulse train
% ts the time vector of the impulses
% dafault value

if nargin < 2; len = 2; end

%ts = (-N/fs/2:1/fs:(N-1)/fs/2).'; % sampling times
ts = ((-len/2):1/fs:(len/2)).';

it = ones(size(ts)); % impulse train

