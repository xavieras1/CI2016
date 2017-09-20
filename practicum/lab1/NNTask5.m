% 1) Define input and output data
% number of samples of each class
N = 20;
% define inputs and outputs
offset = 5; % offset for second class
x = [randn(2,N) randn(2,N)+offset]; % inputs
y = [zeros(1,N) ones(1,N)]; % outputs
% Plot input samples with plotpv (Plot perceptron input/target vectors) figure(1)
plotpv(x,y);
% 2) Create and train the perceptron
net = perceptron; net = train(net, x, y); view(net);
% 3) Plot decision boundary
figure(1)
plotpc(net.IW{1},net.b{1});
% Plot a classification line on a perceptron vector plot