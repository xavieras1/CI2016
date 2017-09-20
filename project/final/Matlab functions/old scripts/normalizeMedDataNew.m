%The aim of this function is to standarize data related to a medical 
%condition selecting one of the different approaches
%A way of normalize the data and find relations by a normal standar
%distribution is (x - xmean) / std_dev, considering that N(mean=0,variance=1)


function [normData] = normalizeMedData(raw_data,norm_type)

    normData = [];
    normData = raw_data;

    %Features
    features = {'jitter_percentage';'jitter_ABS';'jitter_RAP';'jitter_PPQ5';'jitter_DDP';'shimmer';'shimmer_DB';'shimmer_APQ3';'shimmer_APQ5';'shimmer_APQ11';'shimmer_DDA';'NHR';'HNR';'RPDE';'DFA';'PPE'};    
    n_features = size(features,1);

    %Branch 1 All samples from every participant

    %Normalization 1 Mean considering data from every individual
    if(norm_type == 1)

        n_subjects = max(unique(raw_data.subject));
        max_index = 0;
        
        normData.age = (normData.age - mean(normData.age)) / std(normData.age);
        normData.sex = (normData.sex - mean(normData.sex)) / std(normData.sex);


        for i=1:n_subjects 

            min_index = max_index + 1;
            max_index = max_index + sum(raw_data.subject == i);
            
            for j=1:n_features
                normData.(features{j})(min_index:max_index) = (normData.(features{j})(min_index:max_index) - mean(normData.(features{j})(min_index:max_index))) / std(normData.(features{j})(min_index:max_index));
            end
        end
        
    end    

    %Normalization 2 Mean considering data from all individuals
    if(norm_type == 2)

        %Storing the ages above minimal age
        normData.age = (normData.age - mean(normData.age)) / std(normData.age);
        normData.sex = (normData.sex - mean(normData.sex)) / std(normData.sex);

        for i=1:n_features
            normData.(features{i}) = (normData.(features{i}) - mean(normData.(features{i}))) / std(normData.(features{i}));
        end
        
    end 

    %Normalization 3 Ponderated Value considering every individual
    if(norm_type == 3)

        n_subjects = max(unique(raw_data.subject));
        max_index = 0;

        %Storing the ages above minimal age
        %normData.age = normData.age - min(normData.age);

        for i=1:n_subjects 

            min_index = max_index + 1;
            max_index = max_index + sum(raw_data.subject == i);

            for j=1:n_features
                normData.(features{j})(min_index:max_index) = (normData.(features{j})(min_index:max_index) - min(normData.(features{j})(min_index:max_index))) / (max(normData.(features{j})(min_index:max_index)) - min(normData.(features{j})(min_index:max_index)));
            end
            
        end
    end 

    %Normalization 4 Ponderated Value considering all individuals
    if(norm_type == 4)

        %Storing the ages above minimal age
        %normData.age = normData.age - min(normData.age);

        for i=1:n_features
            normData.(features{i}) = (normData.(features{i}) - min(normData.(features{i}))) / (max(normData.(features{i})) - min(normData.(features{i})));
        end
      
    end 


end

