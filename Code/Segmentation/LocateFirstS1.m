function [S1_sample] = LocateFirstS1(positions, newPositions)

[intervals, ~,~] = Intervals(newPositions);

% Maximum interval implies a diastolic period
max_i = max(intervals);

%Start of heart sound
index1 =  find(intervals == max(intervals(:)));

%Locate S2 from maximum interval
S1_sample = newPositions(index1(1)+1,1);


end