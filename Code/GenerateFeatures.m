
clc
close all;
%% load file audio file

file = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav';
file2 = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setB/Btraining_normal/Training B Normal/103_1305031931979_D3.wav';
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
 
 
 %% Determine Shannon Energy to get envelope
 
 [~, s] = Shannon(w2,newfs);


 %% Identify peaks with gradient method
 
 [peaks, positions]= PeakFind(s);

x_axis = positions( 1:length(positions), 1);
y_axis = positions(1:length(positions), 2);

figure;
plot(w2);
hold on;
plot(s ,'r','linewidth',1);
plot(peaks,'y--x');
hold off;

%% Peak Rejection
    
threshold = 0.2;
[newPeaks, newPositions]= PeakRejection(peaks, positions, threshold,true);

figure;
plot(w2);
hold on;
plot(s ,'r','linewidth',1);
plot(newPeaks,'y--x');
hold off;

%% Check for completety missed S1's or S2's

 if isMissedPeaks(newPositions, peaks)
        1
 end