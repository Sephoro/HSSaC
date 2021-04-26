function [features] = Features(files)

 % Initialise the feature vector
 
 features = zeros(length(files),26);
 
 addpath('../Segmentation');
 
 
 
for i = 1:length(files)
   
   file = files(i);
   file = strcat(file.folder, '/' , file.name);
   features(i,1:26) = GenerateFeatures(file,false);
      
end


end