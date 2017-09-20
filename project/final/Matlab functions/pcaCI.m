function [transformed_training_features,transformed_validation_features,...
           eigenvectors,eigenvalues] = pcaCI(training, validation,n_components)

%This function performs PCA on the features used for training and then
%applies the same transformation for the corresponding validation set
%n_components is the number of principal components considered

training_features = table2array(training);
training_features = training_features(:,[2,3,7:22]);

validation_features = table2array(validation);
validation_features = validation_features(:,[2,3,7:22]);

[eigenvectors, transformed_training_features, eigenvalues] = pca(training_features,'Centered',false);

transformed_training_features=transformed_training_features(:,1:n_components);

% apply the transformation from the training set to the validation and test set
transformed_validation_features = validation_features*eigenvectors;
transformed_validation_features=transformed_validation_features(:,1:n_components);

end