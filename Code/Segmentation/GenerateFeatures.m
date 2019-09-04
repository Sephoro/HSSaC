function [features_] = GenerateFeatures(file)


% Generate features for a given file, returns a 1x26 vector of features


    %file = '../../../../Dataset/setB/Btraining_murmur/Btraining_murmur/164_1307106095995_B.wav';
% load file audio file

    [y,fs] = audioread(file);

    %Plot and save figures
        %Figures(y, 'OriginalSignal4');
        %FFTPlot (y,fs, 'fftOrig4');

% Downsample signal to 2kHz

    [x,newfs] = Downsample(y,fs);



% Bandpass Chebyshev filter

    z = Chebyshev(x, newfs);


% Normalise signal [-1,1]

    z_norm = Normalise(z);


% DWT

    w = wdenoise(z_norm,5, ...
            'Wavelet', 'db7', ...
            'DenoisingMethod', 'UniversalThreshold', ...
            'ThresholdRule', 'Soft');

        % Phase 0.9 Features

        [cf, cl] = wavedec(z_norm,6, 'db6');

        ww = appcoef(cf,cl,'db6',6);

        % Get average and std of wavelet approximation of the signal
        meanWavelet = mean(ww);
        stdWavelet = std(ww);


    
% Refiltering using LPF
 
    w2 = Filter(w, newfs);
 
    %Plot and save figures
        %Figures(w2, 'DenoisedSignal4');
        %FFTPlot (w2,newfs, 'fftDenoised4');
 
 
 % Determine Shannon Energy to get envelope
 
    [~, s] = Shannon(w2,newfs);


% Identify peaks with gradient method
 
    [peaks, positions]= PeakFind(s);

% Peak Rejection
    
    threshold = 0.2;
    [newPeaks, newPositions]= PeakRejection(peaks, positions, threshold,true);

    % To be used just shortly
        ps =  newPositions;
    

% Check for completety missed S1's or S2's

    if isMissedPeaks(newPositions, peaks)
    
        [newPeaks, newPositions] = GetMissedPeaks(peaks, positions,length(newPositions));
    
    end
    
    %Plot and save figures
        
        %signals = [w2,s,newPeaks];
        %Figures(signals,'PeakIdentification4')


% Optimize peaks detection
    
    [~, newPositions] = PeakCorrect(newPeaks, newPositions,positions);

    % Phase 0.1 feature
        posRatio = length(ps)/length(newPositions);
        posRatio =  posRatio -floor(posRatio); 

% Currently not being used

    % Locate first S1
    
        % [S1_sample] = LocateFirstS1(positions, newPositions);

    % Locate the rest of the S1 and S2's
    
        % heartsounds = LocateS1S2(S1_sample,newPositions);

% Features
    
    % MFCC
    
        [coeffs,~,~,~] = mfcc(w2,newfs,'NumCoeffs',12);
    
    % PCA
    
        PCA = PrincipalCA(coeffs);
    
    % Means and std's of PCA 
    
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
            
            % If true then S2 is on the even intervals else ...
            
            meanS2 = mean(ev);
            stdS2 = std(ev);
        
            meanS1 = mean(od);
            stdS1 = std(od);
        
            [minstdS2,maxstdS2,mmstdS2] = deviations(ev,stdS2);
            [minstdS1,maxstdS1,mmstdS1] = deviations(od,stdS1);
        
        else
            
            % S2 is on the odd intervals
            
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
    
    
    
      features_ = [stdPCA1 stdPCA2 stdPCA3 meanPCA1 meanPCA2 ...
            meanPCA3 meanS1 meanS2 stdS1 stdS2 rebuildError ...
            ratios stdFFTSHA lenFFTSHA stdlenFFTSHA lenstdFFTSHA ...
            posFFT minstdS1 maxstdS1 mmstdS1 minstdS2 maxstdS2 ...
            mmstdS2 posRatio stdWavelet meanWavelet];
end
    
