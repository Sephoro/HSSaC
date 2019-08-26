function [peaks, positions]= PeakCorrect(peaks, positions,  originalPeaks)

%determine ratio of detected peaks to that of the length of the file
ratio = (length(positions)/(length(peaks)/100))*100;

[peaks,positions,nhflag] = DpPeakCorrect(peaks,positions,ratio);
%There are picks missing ....
if ~nhflag
 
   [peaks,positions,nhflag] = MpPeakCorrect(peaks,positions,originalPeaks);
    
   if ~nhflag
       
       [peaks,positions,nhflag] = DpPeakCorrect(peaks,positions,ratio);
    
   end
    
end


end