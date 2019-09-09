function [] = InitialPlots(file)


    % Generate initial figures for GUI

    [y,fs] = audioread(file);

    % Save a plot of the original signal

        Figures(y, 'OriginalSignal');
        FFTPlot (y,fs, 'fftOrig');

end