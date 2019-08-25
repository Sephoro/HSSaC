
clc
close all;
%% load file audio file

file = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setA/Atraining_normal/Atraining_normal/201101070538.wav';
[y,fs] = audioread(file);

%% Downsample signal to 2kHz

[x,newfs] = Downsample(y,fs);

%% Plot signal & or with FFT

%Plot(y,fs,x,newfs);

%% Bandpass Chebyshev filter

z = Chebyshev(x, newfs);


%% Normalise signal [-1,1]

z_norm = Normalise(y);


%% DWT

w = wdenoise(z_norm,5, ...
        'Wavelet', 'db7', ...
        'DenoisingMethod', 'UniversalThreshold', ...
        'ThresholdRule', 'Soft');
    

    
 %% Refiltering using LPF
 
 [w2] = Filter(y, fs);
 
 Plot(w2,newfs);
 
 %% Determine Shannon Energy to get envelope
 
 [~, s] = Shannon(w2,newfs);
 figure;
 plot(w2);
 hold on;
 plot(s, '-r')
 hold off;
 
 