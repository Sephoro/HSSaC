function [ds,FS] = Downsample(y, fs)
   % To downsample a signal to at least 2000 Hz
   
   % Desired sampling frequency
   
   FS = 2000;
   
   % Downsampling factor
  
   d = floor(fs/FS);
   
   
   % Downsample!
   
   ds = decimate(y,d);
   

end