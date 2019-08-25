
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
%Plot(z, newfs)

%% Normalise signal [-1,1]

z_norm = Normalise(y);

Plot(z_norm, newfs)

%% DWT

w = wdenoise(z_norm,5, ...
        'Wavelet', 'db7', ...
        'DenoisingMethod', 'UniversalThreshold', ...
        'ThresholdRule', 'Soft');
    
 Plot(w,newfs)   