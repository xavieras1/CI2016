FitnessFunction = @(x) (1-x(1))^2+100*(x(2)-x(1)^2)^2;
opts = gaoptimset('Generations',300,'Display','none');
% opts = gaoptimset(opts,'Generations',150,'StallGenLimit', 100);
% opts = gaoptimset(opts,'PopulationSize',500); % population size
opts = gaoptimset(opts,'PopInitRange',[-20 -25; 20 25]); % initial range
% reproduction Crossover and mutation (the best one(percentage))
opts = gaoptimset(opts,'CrossoverFraction',0.3); 
% The selection process (strategy (roulette, stochastic))
opts = gaoptimset(opts, 'SelectionFcn',@selectionuniform,'FitnessScalingFcn',@fitscalingrank); %selection
%opts = gaoptimset(opts, 'FitnessScalingFcn',@fitscalingprop); %selection
% opts = gaoptimset(opts,'PopInitRange',[-2 -2; 2 2]);

rng default % for reproducibility 
record=[];
numeros = [];
i=0;
for n=0:10
    for m=0:10
        numeros = [numeros; i];
        opts = gaoptimset(opts,'PopInitRange',[-n -m; n m]); % initial range
        [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
        record = [record; fval];
        display(i);
        i=i+1;
    end
end
plot(numeros, record); 
xlabel('SelectionFcn');
ylabel('fval')
% [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
% display(fval);