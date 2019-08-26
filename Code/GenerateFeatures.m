
clc
close all;
clear;
%% load file audio file

file = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav';
file2 = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setB/Btraining_normal/Training B Normal/103_1305031931979_D3.wav';
[y,fs] = audioread(file2);

%% Downsample signal to 2kHz

[x,newfs] = Downsample(y,fs);

%% Plot signal & or with FFT

%Plot(y,fs,x,newfs);

%% Bandpass Chebyshev filter

z = Chebyshev(x, newfs);


%% Normalise signal [-1,1]

z_norm = Normalise(z);


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
    
    [newPeaks, newPositions] = GetMissedPeaks(peaks, positions,length(newPositions));
    
end

figure;
plot(w2);
hold on;
plot(s ,'r','linewidth',1);
plot(newPeaks,'y--x');
hold off;

%% Optimize peaks detection
[~, newPositions] = PeakCorrect(newPeaks, newPositions,positions);


%% Locate first S1
    
[S1_sample] = LocateFirstS1(positions, newPositions);

%% Locate the rest of the S1 and S2's
    
heartsounds = LocateS1S2(S1_sample,newPositions);

%% Features
    
    % MFCC
    
    [coeffs,~,~,~] = mfcc(w2,newfs,'NumCoeffs',12);
    
    % PCA
    
    PCA = PrincipalCA(coeffs);
    
     %Means and std's of PCA   
    stdPCA1 = std(PCA(:,1));
    stdPCA2 = std(PCA(:,2));
    stdPCA3 = std(PCA(:,3));
    meanPCA1 =  mean(PCA(:,1));
    meanPCA2 = mean(PCA(:,2));
    meanPCA3 = mean(PCA(:,3));
    
    %Calculate rebuild error
    rebuildError = Error(w,newfs,z_norm, newfs);
    
     [~,ev,od] = Intervals(newPositions);
     
     if mean(ev) > mean(od)
        
        meanS2 = mean(ev);
        stdS2 = std(ev);
        
        meanS1 = mean(od);
        stdS1 = std(od);
        
        [minstdS2,maxstdS2,mmstdS2] = deviations(ev,stdS2);
        [minstdS1,maxstdS1,mmstdS1] = deviations(od,stdS1);
        
     else
        
        meanS2 = mean(od);
        stdS2 = std(od);
        
        meanS1 = mean(ev);
        stdS1 = std(ev);
        
        
        [minstdS2,maxstdS2,mmstdS2] = deviations(od,stdS2);
        [minstdS1,maxstdS1,mmstdS1] = deviations(ev,stdS1);
        
     end
    
    % Another feature
    ratios = (length(newPositions)/(length(peaks)/100))*100; 
    
    % Phase 2 features
    [stdFFTSHA,lenFFTSHA,stdlenFFTSHA,lenstdFFTSHA] = secondPhase(x,newfs);
    
     % Phase 3 features  
    posFFT = thirdPhase(w2,newfs);
    
    
    
    features = [stdPCA1, stdPCA2, stdPCA3, meanPCA1, meanPCA2, ...
            meanPCA3, meanS1,meanS2, stdS1,stdS2, rebuildError, ...
            ratios,stdFFTSHA,lenFFTSHA,stdlenFFTSHA,lenstdFFTSHA, ...
            posFFT,minstdS1,maxstdS1,mmstdS1,minstdS2 ,maxstdS2 ...
            ,mmstdS2];
    