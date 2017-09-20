% The following figure shows a plot of Rastrigin's function.
%plotobjective(@rastriginsfcn,[-5 5; -5 5]);
% To find the minimum of Rastrigin's function from the command line, enter
%[x fval exitflag] = ga(@rastriginsfcn, 2);
%Controls the random number generator, with a seed and a generator (Mersenne Twister in this case)
%rng(14,'twister');

FitnessFunction = @rastriginsfcn; 
numberOfVariables = 2;
opts = gaoptimset('PlotFcns',{@gaplotbestf,@gaplotstopping}); 
opts = gaoptimset(opts,'PopulationSize',10);
opts = gaoptimset(opts,'PopInitRange',[-2 -2; 2 2]);
opts = gaoptimset(opts,'Generations',150,'StallGenLimit', 100);
opts = gaoptimset(opts, 'SelectionFcn',@selectiontournament,'FitnessScalingFcn',@fitscalingprop);
[x,Fval,exitFlag,Output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],[],[],[],opts);

fprintf('The number of generations was : %d\n', Output.generations); 
fprintf('The number of function evaluations was : %d\n', Output.funccount); 
fprintf('The best function value found was : %g\n', Fval);