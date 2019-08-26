function  [minstd,maxstd,mmstd] = deviations(cycle, deviation)

    % Phase 1.1
    
    % The maximum
    
    if length(cycle) > 2
        
        tmpev = cycle;
        maxev = max(tmpev);
        tmpev(tmpev==maxev) = [];
        maxstd = std(tmpev);
        
    else
        maxstd = deviation;
    end
    
  
    
      
    % The Minimum
    
    if length(cycle) > 2
        
        tmpev = cycle;
        minev = min(tmpev);
        tmpev(tmpev==minev) = [];
        minstd = std(tmpev);
    else
        minstd = deviation;
    end
    
   
    % The Minimum and Maximum
    
    if length(cycle) > 3
        
        tmpev = cycle;
        tmpev(tmpev==minev) = [];
        tmpev(tmpev==maxev) = [];
        mmstd = std(tmpev);
        
    else
        mmstd = deviation;
    end
    
   

end