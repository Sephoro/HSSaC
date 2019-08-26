function [Output] = isMissedPeaks(positions, peaks)

%Get the even and odd intervals of the signal
[~, even_intervals, odd_intervals] = Intervals(positions);
 
%calculate the mean of the intervals
e_mean = mean(even_intervals);
o_mean = mean(odd_intervals);

%Get ratio of intervals
a = e_mean/o_mean;
b = o_mean/e_mean;

%set the tolerance is detecting missed peaks
tol = 0.2;
%determine if the ratios is within the tolerance, return true or false
approx_equal = @(a,b,tol) abs(a-b)<tol;
Output = approx_equal(a,b,tol) ==1  &&  (length(positions)/(length(peaks)/100))*100 < 8;


end