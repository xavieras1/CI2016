function [mae_training, mae_validation] = trainNeuralNet(inputs_training,...
    inputs_validation,targets_training,targets_validation,lambda)


    %% Get Inputs and Outputs
%     training_matrix = table2array(training_data);
%     validation_matrix = table2array(validation_data);
    
    % Training
%     inputs_training = training_matrix(:,[2,3,7:22])';                 % input vector
%     targets_training = training_matrix(:,6)';                         % corresponding target output vector
    % Validation
%     inputs_validation = validation_matrix(:,[2,3,7:22])';                 % input vector
%     targets_validation = validation_matrix(:,label)';                         % corresponding target output vector    
    
    n_training = size(inputs_training,2);
    n_validation = size(inputs_validation,2);    
    %% Epochs
    %net.trainParam.epochs = 3000;

    %% Fitting Function
    trainFcn = 'trainbfg';

    %% Create a Fitting Network
    % Size of the hidden layers. The length of the vector determines the number of hidden layers in the network
    hiddenLayerSize = [5];
    net = fitnet(hiddenLayerSize,trainFcn);
    
    % hidden layer(s) transfer function
    net.layers{:}.transferFcn = 'tansig';
    %% Performance Function
    net.performFcn='mae';
    %net.performFcn='mae';
    
    %% Regularization Parameter
    net.performParam.regularization = lambda;

    %% Set up Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 100/100;
    net.divideParam.valRatio = 0/100;
    net.divideParam.testRatio = 0;
    %% Train the Network
    [net,tr] = train(net, inputs_training, targets_training);
    weights = norm(getwb(net));

    %% Test the Network   
    
    % Training
    outputs_training = net(inputs_training);
    errors_training = abs(gsubtract(targets_training, outputs_training));
    mae_training = sum(errors_training(:))/ n_training;
    
    % Validation
    outputs_validation = net(inputs_validation);
    errors_validation = abs(gsubtract(targets_validation, outputs_validation));
    mae_validation = sum(errors_validation(:))/ n_validation;
    %view(net)
    %mae of targets and outputs and then plus lambda * norm of weights

end 


%% Fitting functions
% 'trainlm'     Levenberg-Marquardt
% 'trainbr'     Bayesian Regularization
% 'trainbfg'	BFGS Quasi-Newton
% 'trainrp'     Resilient Backpropagation
% 'trainscg'	Scaled Conjugate Gradient
% 'traincgb'	Conjugate Gradient with Powell/Beale Restarts
% 'traincgf'	Fletcher-Powell Conjugate Gradient
% 'traincgp'	Polak-Ribiére Conjugate Gradient
% 'trainoss'	One Step Secant
% 'traingdx'	Variable Learning Rate Gradient Descent
% 'traingdm'	Gradient Descent with Momentum
% 'traingd'     Gradient Descent