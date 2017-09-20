% Neuron weights
w = [4 -2];
% Neuron bias
b = -3;
% Activation function: Hyperbolic tangent sigmoid function
% tansig: Hyperbolic tangent sigmoid symmetric transfer function
func = 'tansig';
% Activation function: Logistic sigmoid transfer function 
% func = 'logsig'
% Activation function: Hard-limit transfer function (threshold) 
% func = 'hardlim'
% Activation function: Linear transfer function 
% func = 'purelin'

% 2) Define input vectors
p = [2 3];
% 3) Calculate neuron output
activation_potential = p*w'+b;
neuron_output = feval(func, activation_potential);
% 4) Plot neuron output over the range of inputs
[p1,p2] = meshgrid(-10:.25:10);
z = feval(func, [p1(:) p2(:)]*w'+b );
z = reshape(z,length(p1),length(p2)); 
plot3(p1,p2,z);
grid on;
xlabel('Input 1');
ylabel('Input 2');
zlabel('Neuron output(tansig)');

% 5) Change the activation function and plot neuron output again to see the
% different output surfaces
% Activation/Transfer functions:
% hardlim: Positive hard limit transfer function; 
func = 'hardlim';
z = feval(func, [p1(:) p2(:)]*w'+b );
z = reshape(z,length(p1),length(p2)); 
plot3(p1,p2,z);
grid on;
xlabel('Input 1');
ylabel('Input 2');
zlabel('Neuron output(hardlim)');
% hardlims: Symmetric hard limit transfer function; 
func = 'hardlims';
z = feval(func, [p1(:) p2(:)]*w'+b );
z = reshape(z,length(p1),length(p2)); 
plot3(p1,p2,z);
grid on;
xlabel('Input 1');
ylabel('Input 2');
zlabel('Neuron output(hardlims)');
% purelin: Linear transfer function; 
func = 'purelin';
z = feval(func, [p1(:) p2(:)]*w'+b );
z = reshape(z,length(p1),length(p2)); 
% plot3(p1,p2,z);
% grid on;
% xlabel('Input 1');
% ylabel('Input 2');
% zlabel('Neuron output(purelin)');
% satlin: Positive saturating linear transfer function;
func = 'satlin';
z = feval(func, [p1(:) p2(:)]*w'+b );
z = reshape(z,length(p1),length(p2)); 
% plot3(p1,p2,z);
% grid on;
% xlabel('Input 1');
% ylabel('Input 2');
% zlabel('Neuron output(satlin)');
% logsig: Logistic sigmoid transfer function; 
func = 'logsig';
z = feval(func, [p1(:) p2(:)]*w'+b );
z = reshape(z,length(p1),length(p2)); 
% plot3(p1,p2,z);
% grid on;
% xlabel('Input 1');
% ylabel('Input 2');
% zlabel('Neuron output(logsig)');