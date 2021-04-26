function [] = WriteToCSV(filename,  headings, features, class)

% Write the generated features to a CSV file

fid = fopen( filename, 'w' );


fprintf( fid, '%s,', headings(1:length(headings)));

fprintf( fid, '\n');

for k = 1:length(features)
    
    for j = 1 : length(headings)-1
        fprintf( fid, '%d,', features(k,j) );
    end
    fprintf( fid, '%s\n',class(k) );
   
end

fclose( fid );



end