function [y_norm] = Normalise(y)

    % This function normalise the signal y
    %between -1 and 1
    
    % Find the maximum of the signal y
    y_max = max(abs(y));
    
    % Create an empty 1D vector
    
    y_norm = zeros(length(y), 1);
    
    for i = 1:length(y)
    
        y_norm(i) = y(i)/y_max;
        
    end
    
end