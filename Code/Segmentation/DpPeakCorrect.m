function [peaks, positions,nhflag]= DpPeakCorrect(peaks, positions, ratio)


% First attemp at Douple and multiple peaks
estd = 101;
ostd = 102;

nhflag = false;

% Upper the threshold if there are many peaks
if ratio > 14
    [peaks, positions]= PeakRejection(peaks, positions,0.25,false);
elseif ratio < 8
    
    return
end


count = 1;

% Determine the interval length between the picks
while estd > 95 || ostd > 95
%for uu = 1:3
    
    intervals = zeros(length(positions)-1,1);
    
    
    for i = 1:(length(positions) - 1)
        
        intervals (i) = positions(i+1,1) - positions(i,1);
    end
    
    
    % Get the even and odd intervals
    
    ev = intervals(2:2:length(intervals));
    od = intervals(1:2:length(intervals));
    
    % Get the mean and standard deviation to check for missing peaks
    
    estd = std(ev);
    emean = mean(ev);
    
    ostd = std(od);
    omean = mean(od);
    
    % If standard deviation is a certain value the everything is fine
    % else problems ...
    
    % Check which has the highest standard deviation it is probably the
    % one that introduced the error
    
    val = 0;
    
    
    if estd > 95 || ostd > 95
        
        count = count + 1;
        
        % Flag for even or odd intervals
        
        oeflag = 'null';
        
        % Flag for high std but nothing happened
        
        nhflag = false;
        
        if estd> ostd
            
            oeflag = 'e';
            lower = emean - estd;
            [val,nhflag] = getOffValue(ev,lower,'L','false');
            
        else
            
            oeflag = 'o';
            lower = omean - ostd;
            [val,nhflag] = getOffValue(od,lower,'L','false');
        end
        
        
        % To guard for mismatches, incase the standard deviation of the
        % other is higher than the other but the was nothing lower in the
        % one which had a high standard deviation.
        
        if nhflag == false && oeflag == 'e'
            
            lower = omean - ostd;
            [val,nhflag] = getOffValue(od,lower,'L','false');
            
        elseif nhflag == 0 && oeflag == 'o'
            
            lower = emean - estd;
            [val,nhflag] = getOffValue(od,lower,'L','false');
            
        end
        
        %% Phase 2
        
        % Break out if there is nothing lower anymore
        
        if  nhflag == false
            nnnn = nhflag;
            break
        end
        
        % Find the position of the identified value
        i = find(intervals==val);
        
        % Reject peaks with low amplitude
        
        k = reducesSTD(positions,i,oeflag);

        positions(k,:) = [];
        
            
        % Update the peaks for plotting
        
        peaks = nan(length(peaks), 1);
        
        for i = 1:length(peaks)
            
            for j = 1:length(positions(:,1))
                
                if floor(positions(j,1)) == i
                    
                    peaks(i,1) = positions(j,2);
                end
            end
        end
        
    end
    
end

 mean_dif = abs(emean-omean);
 
 if mean_dif < 15
    nhflag = false;
 end
 
end