clear all; close all; clc;

%% read the dataset as a table
data=readtable('parkinson.csv');

%% standardize by individuals (all features except sex and age)
standardized_data = StandardizeDataByIndividual(data);

%% get point estimates for generalization error:
MAE_total_test=[];
MAE_motor_test=[];
MAE_total_train=[];
MAE_motor_train=[];

for i=1

    [model_data,test_data] = GetTrainingTestData(12, standardized_data);

    % Calculate test error:
    % compute mean and std for age from training set
    mu_age=mean(model_data.age);
    sigma_age=std(model_data.age);
    model_data.age=(model_data.age-mu_age)/sigma_age;
    test_data.age=(test_data.age-mu_age)/sigma_age;

    % ... and apply PCA: 
    [transformed_model_features,transformed_test_features,...
        eigenvectors,eigenvalues] = pcaCI(model_data, ...
        test_data,18);

    % MOTOR UPDRS:
    lambda = 0.92;
        %Train the network
        [mae_motor_model, mae_motor_test] = trainNeuralNet(...
        transformed_model_features',transformed_test_features',...
        model_data.motor_UPDRS',test_data.motor_UPDRS',lambda);

    % TOTAL UPDRS:
    lambda = 0.96;
        %Train the network
        [mae_total_model, mae_total_test] = trainNeuralNet(...
        transformed_model_features',transformed_test_features',...
        model_data.total_UPDRS',test_data.total_UPDRS',lambda);
    
    MAE_total_test=[MAE_total_test;mae_total_test];
    MAE_motor_test=[MAE_motor_test;mae_motor_test];
    MAE_total_train=[MAE_total_train;mae_total_model];
    MAE_motor_train=[MAE_motor_train;mae_motor_model];
    
end


mean(MAE_motor_train)
std(MAE_motor_train)

mean(MAE_motor_test)
std(MAE_motor_test)

mean(MAE_total_train)
std(MAE_total_train)

mean(MAE_total_test)
std(MAE_total_test)
