function [intervals, even_intervals, odd_intervals] = Intervals(positions)

% Get the intervals between positions

intervals = [];
even_intervals = [];
odd_intervals = [];

[n, ~] = size(positions);


if ~isempty(positions) && n ~= 1
    
    intervals = zeros(length(positions)-1,1);
    
    for i = 1:length(positions)-1
        
        intervals(i) = positions(i+1,1) - positions(i,1);
        
    end
    
    %even intervals
    even_intervals = intervals(2:2:length(intervals));
    
    %odd intervals
    odd_intervals = intervals(1:2:length(intervals));
    
elseif n == 1
    
    intervals = positions(1,1);
    
end

end