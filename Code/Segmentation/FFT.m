function [y_fft, freq] = FFT(y,fs)

% This function returns the fft of y and the frequency axis
% 20/07/19

L = length(y);

%Number of fft points
NEFT = 2^nextpow2(L);

% The FFT!
y_fft = abs(fft(y,NEFT));

%frequency axis
freq = fs/2*linspace(0,1,NEFT/2+1);

end