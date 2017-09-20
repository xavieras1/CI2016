README

I. File list
------------
AverageOverSixMeasurements.m	This function takes the data as input and averages over the 6 measurements from the same day.
CIScript.m			Main file that calls all the functions and return graphs for given lambda values.
GetCrossValidationSets.m	This function computes the 10-fold cross validation sets from the data.
GetTrainingTestData.m		This function randomly splits the data into training and testing sets.
pcaCI.m				This function performs PCA on the features used for training and then applies the same transformation for the corresponding validation set.
StandardizeDataByIndividual.m	This function standardizes the data by individuals, except for gender. (Age is standardized globally).
trainNeuralNetwork.m		This function trains the neural network with an established architecture.
LMM.m				This function fits a linear mixed effects model to the training data and then computes the given test set MAE.
testing.m			This function process, randomly drawing 12 test subjects, trains the final model on 30 (remaining) subjects, and evaluates it on the test set 100 times.
DimensionalityReductionScript.m	This script is similar to CIScript, but looping through N dimensions instead of looping through lambda.

Neural Network can be built using default arguments and running the file.

II. Lambda values
-----------------
Different lambda values can be computed in internvals in trainNeuralNetwork.m file.
On line 34, different lambda values can be established by inserting different intervals.


III. Different Neural Network Architectures
------------------------------------------
Different architectures can be obtained by modifying certain parameters in trainNeuralNetwork.m file.

On line 10, trainFcn = 'algorithm';
By introducing the name of the algorithm, a new fitting function can be established.

On line 14 net.layers.transferFcn = 'function';
By introducing the name of the function a new activation transfer function can be established.

On line 18 hiddenLayerSize = [#];
Introducing a number will create a layer with the especified neurons, more layers can be added by introducing another number separated by comma.

On line 23 net.performFcn='function';
By introducing the name of the function a new performance function can be established.