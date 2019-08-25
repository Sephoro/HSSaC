function [y_filt] = Filter(y, fs)

% This function filters the signal y and returns y_filt

o = 5; % order of the filter

wn = 195*2/fs;  % convert to normalised freq

% Make the filter
[b,a] = butter(o,wn,'low');

y_filt = filter(b,a,y);

end