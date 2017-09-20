clear all; close all; clc;
%% read the dataset as a table
data=readtable('parkinson.csv');

%% standardize by individuals (all features except sex and age)
standardized_data = StandardizeDataByIndividual(data);
%standardized_averaged_data = StandardizeDataByIndividual(averaged_data);

%% randomly split the data into 12 individuals for testing and 30 for model selection:
[model_data,test_data] = GetTrainingTestData(12, standardized_data);

%% generate the 10-fold cross validation sets:
[training_data, validation_data]=GetCrossValidationSets( model_data );

%% 7) Next we loop through the 10 folds to perform model selection
%initialise performance measures
MAE_motor_training =zeros(10,1);
MAE_motor_validation=zeros(10,1);
MAE_total_training =zeros(10,1);
MAE_total_validation =zeros(10,1);
Mean_motor_training = [];
Mean_motor_validation =[];
Mean_total_training = [];
Mean_total_validation = [];
Std_motor_training = [];
Std_motor_validation = [];
Std_total_training = [];
Std_total_validation = [];

n_components_range=1:1:18;

for j=1:size(n_components_range,2)
    n_components=n_components_range(j)
    for i=1:10
        % compute mean and std for age from training set
        mu_age=mean(training_data{i}.age);
        sigma_age=std(training_data{i}.age);
        training_data{i}.age=(training_data{i}.age-mu_age)/sigma_age;
        validation_data{i}.age=(validation_data{i}.age-mu_age)/sigma_age;

        % ... and apply PCA: 
        [transformed_training_features{i},transformed_validation_features{i},...
            eigenvectors{i},eigenvalues{i}] = pcaCI(training_data{i}, ...
            validation_data{i},n_components);

        % and record the MAE and std. for each:

        % MOTOR UPDRS:
        %Train the network
        [mae_motor_training, mae_motor_validation] = trainNeuralNet(...
            transformed_training_features{i}',transformed_validation_features{i}',...
            training_data{i}.motor_UPDRS',validation_data{i}.motor_UPDRS',0.85);
        %and record training and validation error
        MAE_motor_training(i,1) =mae_motor_training;
        MAE_motor_validation(i,1) =mae_motor_validation;

        % TOTAL UPDRS:
        %Train the network
        [mae_total_training, mae_total_validation] = trainNeuralNet(...
            transformed_training_features{i}',transformed_validation_features{i}',...
            training_data{i}.total_UPDRS',validation_data{i}.total_UPDRS',0.73);
        %save training and validation errors
        MAE_total_training(i,1) = mae_total_training;
        MAE_total_validation(i,1) =mae_total_validation;

    end

    Mean_motor_training = [Mean_motor_training; mean(MAE_motor_training)];
    Mean_motor_validation = [Mean_motor_validation; mean(MAE_motor_validation)];

    Mean_total_training = [Mean_total_training; mean(MAE_total_training)];
    Mean_total_validation = [Mean_total_validation; mean(MAE_total_validation)];

    Std_motor_training = [Std_motor_training; std(MAE_motor_training)];
    Std_motor_validation = [Std_motor_validation; std(MAE_motor_validation)];

    Std_total_training = [Std_total_training; std(MAE_total_training)];
    Std_total_validation = [Std_total_validation; std(MAE_total_validation)];

end

%% plot the results

figure(1);
plot(n_components_range,Mean_motor_training,'-or','MarkerFaceColor','r')
hold on
plot(n_components_range,Mean_motor_validation,'-db','MarkerFaceColor','b')
hold off
title('Motor UPDSR')
xlabel('number of principal components included')
ylabel('MAE')
legend('training error','validation error')

figure(2);
plot(n_components_range, Mean_total_training,'-or','MarkerFaceColor','r')
hold on
plot(n_components_range, Mean_total_validation,'-db','MarkerFaceColor','b')
hold off
title('Total UPDSR')
xlabel('number of principal components included')
ylabel('MAE')
legend('training error','validation error')

%% Calculate test error

% compute mean and std for age from training set
mu_age=mean(model_data.age);
sigma_age=std(model_data.age);
model_data.age=(model_data.age-mu_age)/sigma_age;
test_data.age=(test_data.age-mu_age)/sigma_age;

% ... and apply PCA: 
[transformed_model_features,transformed_test_features,...
    eigenvectors,eigenvalues] = pcaCI(model_data, ...
    test_data, 18);

% MOTOR UPDRS:
    %Train the network
    [mae_motor_model, mae_motor_test] = trainNeuralNet(...
    transformed_model_features',transformed_test_features',...
    model_data.motor_UPDRS',test_data.motor_UPDRS',lambda);
    
% TOTAL UPDRS:
    %Train the network
    [mae_total_model, mae_total_test] = trainNeuralNet(...
    transformed_model_features',transformed_test_features',...
    model_data.total_UPDRS',test_data.total_UPDRS',lambda);


