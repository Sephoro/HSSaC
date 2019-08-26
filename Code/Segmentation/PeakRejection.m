function [peaks, positions]= PeakRejection(peaks, positions, percentage_threshold, firstTime)

% Sort the amplitudes and the third maximum

amplitudes = sort(positions(:,2), 'descend');
third_max = amplitudes(3);

%Determine maximum threshold

threshold = third_max*percentage_threshold;

% Remove peaks smaller than threshold

pos = positions(:,2)>=threshold;
positions = positions(pos,:);

%Remove the first and last peak if there are more than 5 peaks

if firstTime && length(positions) > 5
    
    positions(1,:) = [];
    positions(length(positions),:) = [];
    
end

peaks = nan(length(peaks), 1);

% Update the peaks for plotting

for i = 1:length(peaks)
    
    for j = 1:length(positions(:,1))
        
       if floor(positions(j,1)) == i
          
           peaks(i,1) = positions(j,2); 
       end
    end
end


end