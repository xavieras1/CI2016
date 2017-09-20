for n=0:.05:1
    opts = gaoptimset(opts,'CrossoverFraction',n);
    [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
    record = [record; fval];
end
for n=10:10:1000
    opts = gaoptimset(opts,'PopulationSize',n);
    [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
    record = [record; fval];
end
for n=0:100
    opts = gaoptimset(opts,'PopInitRange',[-n -25; n 25]); % initial range
    [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
    record = [record; fval];
end
for n=0:100
    opts = gaoptimset(opts,'PopInitRange',[-20 -n; 20 n]); % initial range
    [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
    record = [record; fval];
end
for n=1:5
    if n == 1
        opts = gaoptimset(opts, 'SelectionFcn',@selectionstochunif);
    end
    if n ==2
        opts = gaoptimset(opts, 'SelectionFcn',@selectionremainder);
    end
    if n ==3
        opts = gaoptimset(opts, 'SelectionFcn',@selectionuniform);
    end
    if n ==4
        opts = gaoptimset(opts, 'SelectionFcn',@selectionroulette); 
    end
    if n ==5
        opts = gaoptimset(opts, 'SelectionFcn',@selectiontournament); 
    end
    [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
    record = [record; fval];
end
for n=1:4
    if n == 1
        opts = gaoptimset(opts, 'FitnessScalingFcn',@fitscalingrank);
    end
    if n ==2
        opts = gaoptimset(opts, 'FitnessScalingFcn',@fitscalingprop);
    end
    if n ==3
        opts = gaoptimset(opts, 'FitnessScalingFcn',@fitscalingtop);
    end
    if n ==4
        opts = gaoptimset(opts, 'FitnessScalingFcn',@fitscalingshiftlinear); 
    end
    [x fval]=ga(FitnessFunction,2,[],[],[],[],[],[],[],opts); 
    record = [record; fval];
end