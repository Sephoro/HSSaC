function [value, found]= getOffValue(values,threshold,UL,MoveOn)

% This function identifies values that off the threshold

value = 0;
found = false;

if  UL == 'L'
    
    % Find the first value below the threshold
    
    for k = 1:length(values)
        
        
        if  values(k) < threshold
            found = true;
            value = values(k); 
        end
        
    end
    
elseif  UL == 'U'
    
     % Find the first value above the threshold
    
     for k = 1:length(values)
        
        
        if  values(k) > threshold
            found = true;
            
            if MoveOn == false
                value = values(k); 
                break % Exit the loop once the value is found
            else
                if k + 1 <= length(values)
                     k = k + 1;
                    MoveOn = false;
                    found = false;
                end
            end
            
        end
        
    end
    
    
end

end