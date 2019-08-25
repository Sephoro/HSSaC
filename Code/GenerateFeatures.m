%% load file audio file

file = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setA/Atraining_normal/Atraining_normal/201101070538.wav';
[y,fs] = audioread(file);

%% Downsample signal to 2kHz

[x,newfs] = Downsample(y,fs);

plot(y)
figure;
plot(x)