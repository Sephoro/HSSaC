function [peaks, positions,nhflag]= MpPeakCorrect(peaks, positions, originalPeaks)


% First attemp at Missed peaks
count = 0;
moveon = false;
mc = 1;

mean_dif = 1e3;
% Thresholding

amplitudes = sort(positions(:,2), 'descend');

if length(amplitudes) >= 3
third_max = amplitudes(3);

else
    third_max = max(amplitudes);
end

%Determine maximum threshold
threshold = third_max*0.2;

estd = 101;
ostd = 102;


nhflag = false;

while estd > 95 || ostd > 95 || mean_dif < 20
%for uu = 1:7
    
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
    
    
    mean_dif = abs(omean-emean);
    
    % If standard deviation is a certain value the everything is fine
    % else problems ...
    
    % Check which has the highest standard deviation it is probably the
    % one that introduced the error
    
    val = 0;
    
    
    if estd > 95 || ostd > 95 || mean_dif < 20
        
        count = count + 1;
        
        % Flag for even or odd intervals
        
        oeflag = 'null';
        
        % Flag for high std but nothing happened
        
        nhflag = false;
        
        if estd> ostd
            
            oeflag = 'e';
            upper = emean + estd;
            [val,nhflag] = getOffValue(ev,upper,'U',moveon);
            
        else
            
            oeflag = 'o';
            upper = omean + ostd;
            [val,nhflag] = getOffValue(od,upper,'U',moveon);
            
        end
        
        
        % To guard for mismatches, incase the standard deviation of the
        % other is higher than the other but the was nothing lower in the
        % one which had a high standard deviation.
        
        if nhflag == false && oeflag == 'e'
            
            upper = omean + ostd;
            [val,nhflag] = getOffValue(od,upper,'U',moveon);
            oeflag = 'o';
            
        elseif nhflag == 0 && oeflag == 'o'
            
            oeflag = 'e';
            upper = emean + estd;
            [val,nhflag] = getOffValue(ev,upper,'U',moveon);    
        end
        
        %val
        
        if ~val
           nhflag = false;
           break
        end
      
        %ttt = val/2000
        % Phase 2
        
        % Break out if there is nothing lower anymore
         
        % Find the position of the identified value
        i = find(intervals==val);
        
        
        % Find the peaks in the original signal
        
        % From A to B ... You know the saying
        A = positions(i(1),1);
        B = positions(i(1)+1,1);
        
        % A
        % B
         %aaa = A/2000
         %bbb = B/2000
        
        a = find(originalPeaks(:,1)==A);
        b = find(originalPeaks(:,1)==B);
        
        % Find the most prominent peak
        vals = [];
        kk = 1;
        for k = (a+1):(b-1)
            %k
           % oooo = originalPeaks(k,2)
           % uuuu = originalPeaks(k,1)/2000
            if originalPeaks(k,2) >= threshold
             
                vals(kk,:) = originalPeaks(k,:);
                kk = kk + 1;
                
            end
            
        end
        
        %positions(:,1)
         TIME = 0;
         
        if  (nhflag == false && moveon == false) || mc > 3
            nhflag = false;
            break
        end
        
        % Select the one closest to the mean
        if ~isempty(vals)
            
            if oeflag == 'e'
                
                prom = closestToMean(vals,A,omean);
                
            else
                
                prom = closestToMean(vals,A,emean);
            end
            
            
            TIME = prom(1,1)/2000;
            %prom(1,2)
            
            if TIME == 0
                nhflag = false;
                break
            end
            
            positions = [positions(1:i,:);prom;positions(i+1:end,:)];
            
        else
            moveon = true;
            mc = mc + 1;
            
        end
       % moveon
       % TIME
        
        
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

end