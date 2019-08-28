function [prom]= closestToMean(proms, prev, xbar)

% Reject peaks that don't fall within the mean

prom = [0 0];
temp = 1e6;


for i = 1:length(proms(:,1))
    
    if abs((proms(i,1) -prev) - xbar) < temp
       
        temp = abs((proms(i,1) -prev) - xbar);
        prom = proms(i,:);
    end
   
end
  
end