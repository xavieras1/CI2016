%The aim of this function is to standarize data related to a medical 
%condition selecting one of the different approaches
%A way of normalize the data and find relations by a normal standar
%distribution is (x - xmean) / std_dev, considering that N(mean=0,variance=1)


function [normData] = normalizeMedData(raw_data,norm_type)

normData = raw_data;

%Normalization 1 Mean considering data from every individual
if(norm_type == 1)
    
    n_subjects = max(unique(raw_data.subject));
    max_index = 0;
    
    for i=1:n_subjects 
        
        min_index = max_index + 1;
        max_index = max_index + sum(raw_data.subject == i);
        
        normData.PPE(min_index:max_index) = (normData.PPE(min_index:max_index) - mean(normData.PPE(min_index:max_index))) / std(normData.PPE(min_index:max_index));
        normData.DFA(min_index:max_index) = (normData.DFA(min_index:max_index) - mean(normData.DFA(min_index:max_index))) / std(normData.DFA(min_index:max_index));
        normData.HNR(min_index:max_index) = (normData.HNR(min_index:max_index) - mean(normData.HNR(min_index:max_index))) / std(normData.HNR(min_index:max_index));
        normData.RPDE(min_index:max_index) = (normData.RPDE(min_index:max_index) - mean(normData.RPDE(min_index:max_index))) / std(normData.RPDE(min_index:max_index));
        normData.NHR(min_index:max_index) = (normData.NHR(min_index:max_index) - mean(normData.NHR(min_index:max_index))) / std(normData.NHR(min_index:max_index));
        normData.shimmer_DDA(min_index:max_index) = (normData.shimmer_DDA(min_index:max_index) - mean(normData.shimmer_DDA(min_index:max_index))) / std(normData.shimmer_DDA(min_index:max_index));
        normData.shimmer_APQ11(min_index:max_index) = (normData.shimmer_APQ11(min_index:max_index) - mean(normData.shimmer_APQ11(min_index:max_index))) / std(normData.shimmer_APQ11(min_index:max_index));
        normData.shimmer_APQ5(min_index:max_index) = (normData.shimmer_APQ5(min_index:max_index) - mean(normData.shimmer_APQ5(min_index:max_index))) / std(normData.shimmer_APQ5(min_index:max_index));
        normData.shimmer_APQ3(min_index:max_index) = (normData.shimmer_APQ3(min_index:max_index) - mean(normData.shimmer_APQ3(min_index:max_index))) / std(normData.shimmer_APQ3(min_index:max_index));
        normData.shimmer_DB(min_index:max_index) = (normData.shimmer_DB(min_index:max_index) - mean(normData.shimmer_DB(min_index:max_index))) / std(normData.shimmer_DB(min_index:max_index));
        normData.shimmer(min_index:max_index) = (normData.shimmer(min_index:max_index) - mean(normData.shimmer(min_index:max_index))) / std(normData.shimmer(min_index:max_index));
        normData.jitter_DDP(min_index:max_index) = (normData.jitter_DDP(min_index:max_index) - mean(normData.jitter_DDP(min_index:max_index))) / std(normData.jitter_DDP(min_index:max_index));
        normData.jitter_PPQ5(min_index:max_index) = (normData.jitter_PPQ5(min_index:max_index) - mean(normData.jitter_PPQ5(min_index:max_index))) / std(normData.jitter_PPQ5(min_index:max_index));
        normData.jitter_RAP(min_index:max_index) = (normData.jitter_RAP(min_index:max_index) - mean(normData.jitter_RAP(min_index:max_index))) / std(normData.jitter_RAP(min_index:max_index));
        normData.jitter_ABS(min_index:max_index) = (normData.jitter_ABS(min_index:max_index) - mean(normData.jitter_ABS(min_index:max_index))) / std(normData.jitter_ABS(min_index:max_index));
        normData.jitter_percentage(min_index:max_index) = (normData.jitter_percentage(min_index:max_index) - mean(normData.jitter_percentage(min_index:max_index))) / std(normData.jitter_percentage(min_index:max_index));
        normData.total_UPDRS(min_index:max_index) = (normData.total_UPDRS(min_index:max_index) - mean(normData.total_UPDRS(min_index:max_index))) / std(normData.total_UPDRS(min_index:max_index));
        normData.motor_UPDRS(min_index:max_index) = (normData.motor_UPDRS(min_index:max_index) - mean(normData.motor_UPDRS(min_index:max_index))) / std(normData.motor_UPDRS(min_index:max_index));
    
    end    
    
end    

%Normalization 2 Mean considering data from all individuals
if(norm_type == 2)
    
    
    normData.PPE = (normData.PPE - mean(normData.PPE)) / std(normData.PPE);
    normData.DFA = (normData.DFA - mean(normData.DFA)) / std(normData.DFA);
    normData.HNR = (normData.HNR - mean(normData.HNR)) / std(normData.HNR);
    normData.RPDE = (normData.RPDE - mean(normData.RPDE)) / std(normData.RPDE);
    normData.NHR = (normData.NHR - mean(normData.NHR)) / std(normData.NHR);   
    normData.shimmer_DDA = (normData.shimmer_DDA - mean(normData.shimmer_DDA)) / std(normData.shimmer_DDA);  
    normData.shimmer_APQ11 = (normData.shimmer_APQ11 - mean(normData.shimmer_APQ11)) / std(normData.shimmer_APQ11);
    normData.shimmer_APQ5 = (normData.shimmer_APQ5 - mean(normData.shimmer_APQ5)) / std(normData.shimmer_APQ5);   
    normData.shimmer_APQ3 = (normData.shimmer_APQ3 - mean(normData.shimmer_APQ3)) / std(normData.shimmer_APQ3);
    normData.shimmer_DB = (normData.shimmer_DB - mean(normData.shimmer_DB)) / std(normData.shimmer_DB);    
    normData.shimmer = (normData.shimmer - mean(normData.shimmer)) / std(normData.shimmer);
    normData.jitter_DDP = (normData.jitter_DDP - mean(normData.jitter_DDP)) / std(normData.jitter_DDP); 
    normData.jitter_PPQ5 = (normData.jitter_PPQ5 - mean(normData.jitter_PPQ5)) / std(normData.jitter_PPQ5);
    normData.jitter_RAP = (normData.jitter_RAP - mean(normData.jitter_RAP)) / std(normData.jitter_RAP);  
    normData.jitter_ABS = (normData.jitter_ABS - mean(normData.jitter_ABS)) / std(normData.jitter_ABS);
    normData.jitter_percentage = (normData.jitter_percentage - mean(normData.jitter_percentage)) / std(normData.jitter_percentage);   
    normData.total_UPDRS = (normData.total_UPDRS - mean(normData.total_UPDRS)) / std(normData.total_UPDRS);
    normData.motor_UPDRS = (normData.motor_UPDRS - mean(normData.motor_UPDRS)) / std(normData.motor_UPDRS);
    
end 

%Normalization 3 Mean considering the gender of individuals
if(norm_type == 3)
    
    n_subjects = max(unique(raw_data.sex));
    max_index = 0;
    
    for i=1:n_subjects 
        
        min_index = max_index + 1;
        max_index = max_index + sum(raw_data.sex == i);
        
        normData.PPE(min_index:max_index) = (normData.PPE(min_index:max_index) - mean(normData.PPE(min_index:max_index))) / std(normData.PPE(min_index:max_index));
        normData.DFA(min_index:max_index) = (normData.DFA(min_index:max_index) - mean(normData.DFA(min_index:max_index))) / std(normData.DFA(min_index:max_index));
        normData.HNR(min_index:max_index) = (normData.HNR(min_index:max_index) - mean(normData.HNR(min_index:max_index))) / std(normData.HNR(min_index:max_index));
        normData.RPDE(min_index:max_index) = (normData.RPDE(min_index:max_index) - mean(normData.RPDE(min_index:max_index))) / std(normData.RPDE(min_index:max_index));
        normData.NHR(min_index:max_index) = (normData.NHR(min_index:max_index) - mean(normData.NHR(min_index:max_index))) / std(normData.NHR(min_index:max_index));
        normData.shimmer_DDA(min_index:max_index) = (normData.shimmer_DDA(min_index:max_index) - mean(normData.shimmer_DDA(min_index:max_index))) / std(normData.shimmer_DDA(min_index:max_index));
        normData.shimmer_APQ11(min_index:max_index) = (normData.shimmer_APQ11(min_index:max_index) - mean(normData.shimmer_APQ11(min_index:max_index))) / std(normData.shimmer_APQ11(min_index:max_index));
        normData.shimmer_APQ5(min_index:max_index) = (normData.shimmer_APQ5(min_index:max_index) - mean(normData.shimmer_APQ5(min_index:max_index))) / std(normData.shimmer_APQ5(min_index:max_index));
        normData.shimmer_APQ3(min_index:max_index) = (normData.shimmer_APQ3(min_index:max_index) - mean(normData.shimmer_APQ3(min_index:max_index))) / std(normData.shimmer_APQ3(min_index:max_index));
        normData.shimmer_DB(min_index:max_index) = (normData.shimmer_DB(min_index:max_index) - mean(normData.shimmer_DB(min_index:max_index))) / std(normData.shimmer_DB(min_index:max_index));
        normData.shimmer(min_index:max_index) = (normData.shimmer(min_index:max_index) - mean(normData.shimmer(min_index:max_index))) / std(normData.shimmer(min_index:max_index));
        normData.jitter_DDP(min_index:max_index) = (normData.jitter_DDP(min_index:max_index) - mean(normData.jitter_DDP(min_index:max_index))) / std(normData.jitter_DDP(min_index:max_index));
        normData.jitter_PPQ5(min_index:max_index) = (normData.jitter_PPQ5(min_index:max_index) - mean(normData.jitter_PPQ5(min_index:max_index))) / std(normData.jitter_PPQ5(min_index:max_index));
        normData.jitter_RAP(min_index:max_index) = (normData.jitter_RAP(min_index:max_index) - mean(normData.jitter_RAP(min_index:max_index))) / std(normData.jitter_RAP(min_index:max_index));
        normData.jitter_ABS(min_index:max_index) = (normData.jitter_ABS(min_index:max_index) - mean(normData.jitter_ABS(min_index:max_index))) / std(normData.jitter_ABS(min_index:max_index));
        normData.jitter_percentage(min_index:max_index) = (normData.jitter_percentage(min_index:max_index) - mean(normData.jitter_percentage(min_index:max_index))) / std(normData.jitter_percentage(min_index:max_index));
        normData.total_UPDRS(min_index:max_index) = (normData.total_UPDRS(min_index:max_index) - mean(normData.total_UPDRS(min_index:max_index))) / std(normData.total_UPDRS(min_index:max_index));
        normData.motor_UPDRS(min_index:max_index) = (normData.motor_UPDRS(min_index:max_index) - mean(normData.motor_UPDRS(min_index:max_index))) / std(normData.motor_UPDRS(min_index:max_index));
    
    end    
    
end 

%Normalization 4 Ponderated Value considering all individuals
if(norm_type == 4)
    
    normData.PPE = (normData.PPE - min(normData.PPE)) / (max(normData.PPE) - min(normData.PPE));
    normData.DFA = (normData.DFA - min(normData.DFA)) / (max(normData.DFA) - min(normData.DFA));
    normData.HNR = (normData.HNR - min(normData.HNR)) / (max(normData.HNR) - min(normData.HNR));
    normData.RPDE = (normData.RPDE - min(normData.RPDE)) / (max(normData.RPDE) - min(normData.RPDE));    
    normData.NHR = (normData.NHR - min(normData.NHR)) / (max(normData.NHR) - min(normData.NHR));    
    normData.shimmer_DDA = (normData.shimmer_DDA - min(normData.shimmer_DDA)) / (max(normData.shimmer_DDA) - min(normData.shimmer_DDA));   
    normData.shimmer_APQ11 = (normData.shimmer_APQ11 - min(normData.shimmer_APQ11)) / (max(normData.shimmer_APQ11) - min(normData.shimmer_APQ11));
    normData.shimmer_APQ5 = (normData.shimmer_APQ5 - min(normData.shimmer_APQ5)) / (max(normData.shimmer_APQ5) - min(normData.shimmer_APQ5));    
    normData.shimmer_APQ3 = (normData.shimmer_APQ3 - min(normData.shimmer_APQ3)) / (max(normData.shimmer_APQ3) - min(normData.shimmer_APQ3));
    normData.shimmer_DB = (normData.shimmer_DB - min(normData.shimmer_DB)) / (max(normData.shimmer_DB) - min(normData.shimmer_DB));    
    normData.shimmer = (normData.shimmer - min(normData.shimmer)) / (max(normData.shimmer) - min(normData.shimmer));
    normData.jitter_DDP = (normData.jitter_DDP - min(normData.jitter_DDP)) / (max(normData.jitter_DDP) - min(normData.jitter_DDP));    
    normData.jitter_PPQ5 = (normData.jitter_PPQ5 - min(normData.jitter_PPQ5)) / (max(normData.jitter_PPQ5) - min(normData.jitter_PPQ5));
    normData.jitter_RAP = (normData.jitter_RAP - min(normData.jitter_RAP)) / (max(normData.jitter_RAP) - min(normData.jitter_RAP));    
    normData.jitter_ABS = (normData.jitter_ABS - min(normData.jitter_ABS)) / (max(normData.jitter_ABS) - min(normData.jitter_ABS));
    normData.jitter_percentage = (normData.jitter_percentage - min(normData.jitter_percentage)) / (max(normData.jitter_percentage) - min(normData.jitter_percentage));    
    normData.total_UPDRS = (normData.total_UPDRS - min(normData.total_UPDRS)) / (max(normData.total_UPDRS) - min(normData.total_UPDRS));
    normData.motor_UPDRS = (normData.motor_UPDRS - min(normData.motor_UPDRS)) / (max(normData.motor_UPDRS) - min(normData.motor_UPDRS));

end 

%Normalization 5 Ponderated Value considering every individual
if(norm_type == 5)
    
    n_subjects = max(unique(raw_data.subject));
    max_index = 0;
    
    for i=1:n_subjects 
        
        min_index = max_index + 1;
        max_index = max_index + sum(raw_data.subject == i);
    
        normData.PPE(min_index:max_index) = (normData.PPE(min_index:max_index) - min(normData.PPE(min_index:max_index))) / (max(normData.PPE(min_index:max_index)) - min(normData.PPE(min_index:max_index)));
        normData.DFA(min_index:max_index) = (normData.DFA(min_index:max_index) - min(normData.DFA(min_index:max_index))) / (max(normData.DFA(min_index:max_index)) - min(normData.DFA(min_index:max_index)));
        normData.HNR(min_index:max_index) = (normData.HNR(min_index:max_index) - min(normData.HNR(min_index:max_index))) / (max(normData.HNR(min_index:max_index)) - min(normData.HNR(min_index:max_index)));
        normData.RPDE(min_index:max_index) = (normData.RPDE(min_index:max_index) - min(normData.RPDE(min_index:max_index))) / (max(normData.RPDE(min_index:max_index)) - min(normData.RPDE(min_index:max_index)));    
        normData.NHR(min_index:max_index) = (normData.NHR(min_index:max_index) - min(normData.NHR(min_index:max_index))) / (max(normData.NHR(min_index:max_index)) - min(normData.NHR(min_index:max_index)));    
        normData.shimmer_DDA(min_index:max_index) = (normData.shimmer_DDA(min_index:max_index) - min(normData.shimmer_DDA(min_index:max_index))) / (max(normData.shimmer_DDA(min_index:max_index)) - min(normData.shimmer_DDA(min_index:max_index)));   
        normData.shimmer_APQ11(min_index:max_index) = (normData.shimmer_APQ11(min_index:max_index) - min(normData.shimmer_APQ11(min_index:max_index))) / (max(normData.shimmer_APQ11(min_index:max_index)) - min(normData.shimmer_APQ11(min_index:max_index)));
        normData.shimmer_APQ5(min_index:max_index) = (normData.shimmer_APQ5(min_index:max_index) - min(normData.shimmer_APQ5(min_index:max_index))) / (max(normData.shimmer_APQ5(min_index:max_index)) - min(normData.shimmer_APQ5(min_index:max_index)));    
        normData.shimmer_APQ3(min_index:max_index) = (normData.shimmer_APQ3(min_index:max_index) - min(normData.shimmer_APQ3(min_index:max_index))) / (max(normData.shimmer_APQ3(min_index:max_index)) - min(normData.shimmer_APQ3(min_index:max_index)));
        normData.shimmer_DB(min_index:max_index) = (normData.shimmer_DB(min_index:max_index) - min(normData.shimmer_DB(min_index:max_index))) / (max(normData.shimmer_DB(min_index:max_index)) - min(normData.shimmer_DB(min_index:max_index)));    
        normData.shimmer(min_index:max_index) = (normData.shimmer(min_index:max_index) - min(normData.shimmer(min_index:max_index))) / (max(normData.shimmer(min_index:max_index)) - min(normData.shimmer(min_index:max_index)));
        normData.jitter_DDP(min_index:max_index) = (normData.jitter_DDP(min_index:max_index) - min(normData.jitter_DDP(min_index:max_index))) / (max(normData.jitter_DDP(min_index:max_index)) - min(normData.jitter_DDP(min_index:max_index)));    
        normData.jitter_PPQ5(min_index:max_index) = (normData.jitter_PPQ5(min_index:max_index) - min(normData.jitter_PPQ5(min_index:max_index))) / (max(normData.jitter_PPQ5(min_index:max_index)) - min(normData.jitter_PPQ5(min_index:max_index)));
        normData.jitter_RAP(min_index:max_index) = (normData.jitter_RAP(min_index:max_index) - min(normData.jitter_RAP(min_index:max_index))) / (max(normData.jitter_RAP(min_index:max_index)) - min(normData.jitter_RAP(min_index:max_index)));    
        normData.jitter_ABS(min_index:max_index) = (normData.jitter_ABS(min_index:max_index) - min(normData.jitter_ABS(min_index:max_index))) / (max(normData.jitter_ABS(min_index:max_index)) - min(normData.jitter_ABS(min_index:max_index)));
        normData.jitter_percentage(min_index:max_index) = (normData.jitter_percentage(min_index:max_index) - min(normData.jitter_percentage(min_index:max_index))) / (max(normData.jitter_percentage(min_index:max_index)) - min(normData.jitter_percentage(min_index:max_index)));    
        normData.total_UPDRS(min_index:max_index) = (normData.total_UPDRS(min_index:max_index) - min(normData.total_UPDRS(min_index:max_index))) / (max(normData.total_UPDRS(min_index:max_index)) - min(normData.total_UPDRS(min_index:max_index)));
        normData.motor_UPDRS(min_index:max_index) = (normData.motor_UPDRS(min_index:max_index) - min(normData.motor_UPDRS(min_index:max_index))) / (max(normData.motor_UPDRS(min_index:max_index)) - min(normData.motor_UPDRS(min_index:max_index)));

    end
end 

%Normalization 6 Ponderated Value considering gender of individuals
if(norm_type == 6)
    
    n_subjects = max(unique(raw_data.sex));
    max_index = 0;
    
    for i=1:n_subjects 
        
        min_index = max_index + 1;
        max_index = max_index + sum(raw_data.sex == i);
    
        normData.PPE(min_index:max_index) = (normData.PPE(min_index:max_index) - min(normData.PPE(min_index:max_index))) / (max(normData.PPE(min_index:max_index)) - min(normData.PPE(min_index:max_index)));
        normData.DFA(min_index:max_index) = (normData.DFA(min_index:max_index) - min(normData.DFA(min_index:max_index))) / (max(normData.DFA(min_index:max_index)) - min(normData.DFA(min_index:max_index)));
        normData.HNR(min_index:max_index) = (normData.HNR(min_index:max_index) - min(normData.HNR(min_index:max_index))) / (max(normData.HNR(min_index:max_index)) - min(normData.HNR(min_index:max_index)));
        normData.RPDE(min_index:max_index) = (normData.RPDE(min_index:max_index) - min(normData.RPDE(min_index:max_index))) / (max(normData.RPDE(min_index:max_index)) - min(normData.RPDE(min_index:max_index)));    
        normData.NHR(min_index:max_index) = (normData.NHR(min_index:max_index) - min(normData.NHR(min_index:max_index))) / (max(normData.NHR(min_index:max_index)) - min(normData.NHR(min_index:max_index)));    
        normData.shimmer_DDA(min_index:max_index) = (normData.shimmer_DDA(min_index:max_index) - min(normData.shimmer_DDA(min_index:max_index))) / (max(normData.shimmer_DDA(min_index:max_index)) - min(normData.shimmer_DDA(min_index:max_index)));   
        normData.shimmer_APQ11(min_index:max_index) = (normData.shimmer_APQ11(min_index:max_index) - min(normData.shimmer_APQ11(min_index:max_index))) / (max(normData.shimmer_APQ11(min_index:max_index)) - min(normData.shimmer_APQ11(min_index:max_index)));
        normData.shimmer_APQ5(min_index:max_index) = (normData.shimmer_APQ5(min_index:max_index) - min(normData.shimmer_APQ5(min_index:max_index))) / (max(normData.shimmer_APQ5(min_index:max_index)) - min(normData.shimmer_APQ5(min_index:max_index)));    
        normData.shimmer_APQ3(min_index:max_index) = (normData.shimmer_APQ3(min_index:max_index) - min(normData.shimmer_APQ3(min_index:max_index))) / (max(normData.shimmer_APQ3(min_index:max_index)) - min(normData.shimmer_APQ3(min_index:max_index)));
        normData.shimmer_DB(min_index:max_index) = (normData.shimmer_DB(min_index:max_index) - min(normData.shimmer_DB(min_index:max_index))) / (max(normData.shimmer_DB(min_index:max_index)) - min(normData.shimmer_DB(min_index:max_index)));    
        normData.shimmer(min_index:max_index) = (normData.shimmer(min_index:max_index) - min(normData.shimmer(min_index:max_index))) / (max(normData.shimmer(min_index:max_index)) - min(normData.shimmer(min_index:max_index)));
        normData.jitter_DDP(min_index:max_index) = (normData.jitter_DDP(min_index:max_index) - min(normData.jitter_DDP(min_index:max_index))) / (max(normData.jitter_DDP(min_index:max_index)) - min(normData.jitter_DDP(min_index:max_index)));    
        normData.jitter_PPQ5(min_index:max_index) = (normData.jitter_PPQ5(min_index:max_index) - min(normData.jitter_PPQ5(min_index:max_index))) / (max(normData.jitter_PPQ5(min_index:max_index)) - min(normData.jitter_PPQ5(min_index:max_index)));
        normData.jitter_RAP(min_index:max_index) = (normData.jitter_RAP(min_index:max_index) - min(normData.jitter_RAP(min_index:max_index))) / (max(normData.jitter_RAP(min_index:max_index)) - min(normData.jitter_RAP(min_index:max_index)));    
        normData.jitter_ABS(min_index:max_index) = (normData.jitter_ABS(min_index:max_index) - min(normData.jitter_ABS(min_index:max_index))) / (max(normData.jitter_ABS(min_index:max_index)) - min(normData.jitter_ABS(min_index:max_index)));
        normData.jitter_percentage(min_index:max_index) = (normData.jitter_percentage(min_index:max_index) - min(normData.jitter_percentage(min_index:max_index))) / (max(normData.jitter_percentage(min_index:max_index)) - min(normData.jitter_percentage(min_index:max_index)));    
        normData.total_UPDRS(min_index:max_index) = (normData.total_UPDRS(min_index:max_index) - min(normData.total_UPDRS(min_index:max_index))) / (max(normData.total_UPDRS(min_index:max_index)) - min(normData.total_UPDRS(min_index:max_index)));
        normData.motor_UPDRS(min_index:max_index) = (normData.motor_UPDRS(min_index:max_index) - min(normData.motor_UPDRS(min_index:max_index))) / (max(normData.motor_UPDRS(min_index:max_index)) - min(normData.motor_UPDRS(min_index:max_index)));

    end
end 


end

