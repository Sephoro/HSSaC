function  [posFFT] = thirdPhase(w2,newFS)

% Phase 3 of feature extraction


[x_fft, freqx] = FFT(w2,newFS);

[~, s] = Shannon(x_fft,newFS);

[~, positions ]= PeakFind(s(1:length(freqx)));

[~, newPositions]= PeakR(peaks, positions,0.001);

posFFT = length(newPositions);



end