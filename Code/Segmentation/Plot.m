function[] = Plot(y,fs,x,newFS)

%Plot two signals and their FFTs against each other

% Check number of arguments
if nargin == 4
    
    % Compute the time
    time = (0:length(y)-1)/fs;
    t = (0:length(x)-1)/newFS;
    
    
    figure
    % Original Signal
    subplot 221
    plot(time,y)
    xlabel('Time (s)')
    grid on
    title('Original Signal')
    
    % FFT
    [y_fft, freq] = FFT(y,fs);
    subplot 222
    plot(freq, y_fft(1:length(freq)), 'red');
    title('FFT of Original Signal')
    grid on
    xlim([0 500])
    
    
    % Comapred Signal
    subplot 223
    plot(t,x)
    xlabel('Time (s)')
    title('Compared Signal')
    grid on
    
    
    % FFT
    [x_fft, freqx] = FFT(x,newFS);
    subplot 224
    plot(freqx, x_fft(1:length(freqx)), 'green');
    title('FFT of Compared Signal')
    grid on
    xlim([0 500])
        
else
    
    %determine the time
    time = (0:length(y)-1)/fs;
     
    figure
    % Just want to plot one signal and its FFT
    subplot 211
    plot(time,y)
    xlabel('Time (s)')
    grid on
    title('Original Signal')
    
    % FFT
    [y_fft, freq] = FFT(y,fs);
    subplot 212
    plot(freq, y_fft(1:length(freq)), 'red');
    title('FFT')
    grid on
    xlim([0 500])
    

end

end