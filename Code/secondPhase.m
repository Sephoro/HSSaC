function  [stdFFTSHA,lenFFTSHA,stdlenFFTSHA,lenstdFFTSHA] = secondPhase(x,newFS)

    % Second Phase of features
    
    % Normalise the signal

    z_norm  = Normalise(x);

    % Get wavelet approximation

    w = wdenoise(z_norm,5, ...
        'Wavelet', 'db7', ...
        'DenoisingMethod', 'UniversalThreshold', ...
        'ThresholdRule', 'Soft');

    % Get the FFT
    
    [x_fft, ~] = FFT(w,newFS);
    
    % Get the Shannon Energy of the FFT

    [~, s] = Sh(x_fft,newFS);


    % Get the sample from 1800-2000
    
    tt = abs(s(1800:2000));

    % Identify peaks
    
    [peaks, positions ]= PeakFind(tt);
 
    %  Reject Extra Peaks
    
    [~, newPositions]= PeakR(peaks, positions,0.40);
    
    % Get the numper of peaks
    lenFFTSHA = length(newPositions);
    
    % Compute the intervals
    [intervals,~,~] = Intervals(newPositions);
    
    % Get the std of the intervals
    
    if ~isempty(intervals)
        stdFFTSHA = std(intervals);
    else
        stdFFTSHA = -1;
    end
    
    % Get the ratios
    
    if stdFFTSHA ~= 0
        
        lenstdFFTSHA = length(newPositions)/stdFFTSHA;
    else
        lenstdFFTSHA =  lenFFTSHA;
    end
    
    if  lenFFTSHA ~= 0 
        
        stdlenFFTSHA = stdFFTSHA/lenFFTSHA;
    else
        stdlenFFTSHA =  stdFFTSHA;
    end
   
end