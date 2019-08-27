function [k]= reducesSTD(positions,i,oeflag)

    % prom is a value from offvalues that leaves values with a low std
    % deviation compared to the other offvalues
    
     positionsA = positions; % For ith position
     positionsB = positions; % For ith + 1 position
      
     positionsA(i(1),:) = [];
     positionsB(i(1)+1,:) = [];
     
     % Get intervals for both the positions
     
     intervalsA = Intervals(positionsA);
     intervalsB = Intervals(positionsB);
     

     if oeflag == 'o'
         valuesA = intervalsA(1:2:length(intervalsA));
         valuesB = intervalsB(1:2:length(intervalsB));
     elseif oeflag == 'e'
         valuesA = intervalsA(2:2:length(intervalsA));
         valuesB = intervalsB(2:2:length(intervalsB));
         
     end
     
     % Decision Time
     
     stdA = std(valuesA);
     stdB = std(valuesB);
     
     if stdA < stdB
         k = i;
     else
         k = i + 1;
     end
    
end
