function [peaks, positions] = PeakFind(y)

 % Find peaks using the gradient

 % For Plotting
 peaks = nan(length(y), 1);
 
 % For peak location and values
 positions = [];
 
 % Counter for positions
 counter = 1;
 
 G = 0;
 
 for i = 1:length(y)-1 
    
     % Compute the gradient
     g = (y(i+1) - y(i))/((i+1) - i);
     
     % Spot the peaks
     if (g <= 0) && (G > 0)

         peaks(i) = y(i);
         positions(counter,1) = i;
         positions(counter,2) = peaks(i);
         
         counter = counter + 1;
         
     end
     
     G = g;
     
     
 end

 
 % Reject first and last peaks
 
end