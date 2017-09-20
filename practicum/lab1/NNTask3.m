% 1) Define one sample: inputs and outputs. An example of one instance of 6
% input values that has as output two output values:
%inputs = [1:6]'; % input vector (6-dimensional pattern) 
%outputs = [1 2]'; % corresponding target output vector
% You can modify them if you like. For example you can have 6 instances of
% 1 input variable that have as output 1 output value.
inputs = [1:6]; % input vector (6-dimensional pattern) 
outputs = [7:12]; % corresponding target output vector
numInputs = 1;
numLayers = 2;
biasConnect = [1; 0];
inputConnect = [1; 0];
a = 0;
b = 0;
c = 1;
d = 0;
layerConnect = [a b; c d];
outputConnect = [0 1];
% create the network: 1 input, 2 layer (1 hidden layer and 1 output layer),
% feed-forward network
net = network(numInputs,numLayers,biasConnect,inputConnect,layerConnect,outputConnect);
% numInputs (number of inputs)
% numLayers (number of layers)
% biasConnect (numLayers-by-1 Boolean vector)
% inputConnect (numLayers-by-numInputs Boolean matrix)
% layerConnect (numLayers-by-numLayers Boolean matrix); [a b; c d] ... 
% a: 1st-layer with itself, b: 2nd-layer with 1st-layer,
% c: 1st-layer with 2nd-layer, d: 2nd-layer with itself
% outputConnect (1-by-numLayers Boolean vector)

% View network structure 
% view(net);

% Define topology and transfer function
% number of hidden layer neurons
net.layers{1}.name = 'first';
net.layers{1}.size = 5;
% hidden layer transfer function
net.layers{1}.transferFcn = 'logsig'; 
%view(net);
% Configure the network
net = configure(net,inputs,outputs); 
view(net);

% Train net and calculate neuron output
% initial network response without training (the network is resimulated)
initial_output = net(inputs);

% We can get the weight matrices and bias vector as follows:
net.IW{1};
net.LW{2};
net.b{1};
% network training
net.trainFcn = 'trainlm'; % trainlm: Levenberg-Marquardt backpropagation 
% trainlm is often the fastest backpropagation algorithm in the toolbox,
% and is highly recommended as a first choice supervised algorithm,
% although it does require more memory than other algorithms. 
net.performFcn = 'mse';
net = train(net,inputs,outputs);
% network response after training (the network is resimulated)
final_output = net(inputs);
% final weight matrices and bias vector:
net.IW{1};
net.LW{2};
net.b{1};