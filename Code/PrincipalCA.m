function [PCs] = PrincipalCA(X)


    % To perform Principal Component Analysis
    % Elias Sepuru 03/08/2019


    % Standardize the data
    
    X = zscore(X);
    
    % Get the PCA

    [~,PCs,~] = pca(X, 'Centered', true, 'VariableWeights', 'variance');

end