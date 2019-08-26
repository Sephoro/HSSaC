function [newPeaks, newPositions] = GetMissedPeaks(peaks, positions, size_)

threshold = 0.2;
tolerance = 0.02;
updatedsize = size_;

 while size_ < (2*updatedsize + 3) && threshold > 0
     
     threshold = threshold-tolerance;
     [newPeaks, newPositions]= PeakRejection(peaks, positions, threshold, false);
     size_ = length(newPositions);
      
 end


end