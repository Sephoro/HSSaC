clc
clear
close all

% This is the main file for generating features for training

% Signals, directory to the Audio files
    
    Anorms = dir('../../../../Dataset/setA/Atraining_normal/Atraining_normal/*.wav');
    Amur = dir('../../../../Dataset/setA/Atraining_murmur/Atraining_murmur/*.wav');
    Aextr = dir('../../../../Dataset/setA/Atraining_extrahs/Atraining_extrahls/*.wav');
    art = dir('../../../../Dataset/setA/Atraining_artifact/Atraining_artifact/*.wav');

    Bnorms = dir('../../../../Dataset/setB/Btraining_normal/Training B Normal/*.wav');
    Bmur = dir('../../../../Dataset/setB/Btraining_murmur/Btraining_murmur/*.wav');
    Bnoisynorms = dir('../../../../Dataset/setB/Btraining_normal/Training B Normal/Btraining_noisynormal/*.wav');
    Bextr = dir('../../../../Dataset/setB/Btraining_extrasystole/Btraining_extrastole/*.wav');

         

% Which dataset do you want to generate features for?
dataset = 'A';

if dataset == 'A'
    
    % For Dataset A
    
    feature1 = Features(Anorms);
    feature2 = Features(Amur);
    feature3 = Features(Aextr);
    featuresArt = Features(art);
    
    

    classA(1:length(feature1), 1) = "Normal";
    classB(1:length(feature2), 1) = "Murmur";
    classC(1:length(feature3), 1) = "ExtraHeartSound";
    classD(1:length(art),1) = "Artifact";

    class = [classA;classB;classC;classD];
    features = [feature1 ;feature2 ;feature3; featuresArt];
    
    filename = '../Dataset/heartbeatFeaturesA4.csv';
else
    
    % For Dataset B
    
    feature1 = Features(Bnorms);
    feature2 = Features(Bmur);
    feature3 = Features(Bextr);

    
    

    classA(1:length(feature1), 1) = "Normal";
    classB(1:length(feature2), 1) = "Murmur";
    classC(1:length(feature3), 1) = "Extrasystole";


    class = [classA;classB;classC];
    features = [feature1 ;feature2 ;feature3];
    
    filename = '../Dataset/heartbeatFeaturesB4.csv';
    
end


% Headings of the features

    headings = ["stdPCA1" "stdPCA2" "stdPCA3" "meanPCA1" "meanPCA2" ...
        "meanPCA3" "meanS1" "meanS2" "stdS1" "stdS2" ...
        "rebuildError" "ratios" "stdFFTSHA" "lenFFTSHA" ...
        "stdlenFFTSHA" "lenstdFFTSHA" "posFFT" "minstdS1" ...
        "maxstdS1" "mmstdS1" "minstdS2" "maxstdS2" "mmstdS2" ...
        "posRatio" "stdWavelet" "meanWavelet" "class"];
    
% Write the generated features to a CSV file
    
    WriteToCSV(filename, headings, features, class);

