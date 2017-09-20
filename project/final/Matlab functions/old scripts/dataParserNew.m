%CI The Parkinson Project

%The main function of this script is to generate different types of
%datasets in order to analyze the correlation of the variables to perform
%Principal Components Analysis and other methods to main only relevant
%features of the medical data set.

close all; clc;

filePath = 'parkinson.csv';

parkinson = importdata(filePath);

features_classes = {'subject';'age';'sex';'test_time';'motor_UPDRS';'total_UPDRS';'jitter_percentage';'jitter_ABS';'jitter_RAP';'jitter_PPQ5';'jitter_DDP';'shimmer';'shimmer_DB';'shimmer_APQ3';'shimmer_APQ5';'shimmer_APQ11';'shimmer_DDA';'NHR';'HNR';'RPDE';'DFA';'PPE'};    

raw_data = struct();
for i=1:size(parkinson.data,2)
    raw_data = setfield(raw_data,features_classes{i},parkinson.data(:,i));
end

%Branch 1: All samples from every participant

%Normalization 1 Mean considering data from every individual
data_norm1 = normalizeMedData(raw_data,1);
mat_norm1 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm1(:,i) = getfield(data_norm1,features_classes{i});
end
cov_mat_norm1 = cov(mat_norm1);
dlmwrite('normalization1.txt',mat_norm1,',');

%Normalization 2 Mean considering data from all individuals
data_norm2 = normalizeMedData(raw_data,2);
mat_norm2 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm2(:,i) = getfield(data_norm2,features_classes{i});
end
cov_mat_norm2 = cov(mat_norm2);
dlmwrite('normalization2.txt',mat_norm2,',');

%Normalization 3 Ponderated Value considering every individual
data_norm3 = normalizeMedData(raw_data,3);
mat_norm3 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm3(:,i) = getfield(data_norm3,features_classes{i});
end
cov_mat_norm3 = cov(mat_norm3);
dlmwrite('normalization3.txt',mat_norm3,',');

%Normalization 4 Ponderated Value considering all individuals
data_norm4 = normalizeMedData(raw_data,4);
mat_norm4 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm4(:,i) = getfield(data_norm4,features_classes{i});
end
cov_mat_norm4 = cov(mat_norm4);
dlmwrite('normalization4.txt',mat_norm4,',');



%---------------------------------------------------------------------



%Branch 2: Averaging every participant same-time measures in 6-month period

%Average of the raw_data based on the perioical measures coincidences
%Initialization of raw_data_avg
raw_data_avg = struct();
for i=1:size(parkinson.data,2)
    raw_data_avg = setfield(raw_data_avg,features_classes{i},[]);
end

%Number of different subjects
n_subjects = size(unique(raw_data.subject),1);

for i=1:n_subjects %subjects
    
    %Monthly periodical measures of test_time for subject i
    pmeasures_test_time = unique(int32(raw_data.test_time(raw_data.subject == i)));
    for j=1:size(pmeasures_test_time,1) %periodical measures        
 
        matched_pmeasures_test_time_indexes = int32(raw_data.test_time(raw_data.subject == i)) == pmeasures_test_time(j);
        for k=1:size(features_classes,1) %features and classes
         
            subject_feature = raw_data.(features_classes{k})(raw_data.subject == i);
            subject_feat_match_values = subject_feature(matched_pmeasures_test_time_indexes);
            raw_data_avg.(features_classes{k})(end+1) = mean(subject_feat_match_values);
        
        end
        

    end
       
end

%Transposing raw_data_avg features 
for k=1:size(features_classes,1) %features and classes
    raw_data_avg.(features_classes{k}) = raw_data_avg.(features_classes{k})';   
end


%Normalization 5 Mean considering data from every individual
data_norm5 = normalizeMedData(raw_data_avg,1);
mat_norm5 = zeros(size(raw_data_avg.subject,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm5(:,i) = getfield(data_norm5,features_classes{i});
end
cov_mat_norm5 = cov(mat_norm5);
dlmwrite('normalization5.txt',mat_norm5,',');

%Normalization 6 Mean considering data from all individuals
data_norm6 = normalizeMedData(raw_data_avg,2);
mat_norm6 = zeros(size(raw_data_avg.subject,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm6(:,i) = getfield(data_norm6,features_classes{i});
end
cov_mat_norm6 = cov(mat_norm6);
dlmwrite('normalization6.txt',mat_norm6,',');

%Normalization 7 Ponderated Value considering every individual
data_norm7 = normalizeMedData(raw_data_avg,3);
mat_norm7 = zeros(size(raw_data_avg.subject,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm7(:,i) = getfield(data_norm7,features_classes{i});
end
cov_mat_norm7 = cov(mat_norm7);
dlmwrite('normalization7.txt',mat_norm7,',');

%Normalization 8 Ponderated Value considering all individuals
data_norm8 = normalizeMedData(raw_data_avg,4);
mat_norm8 = zeros(size(raw_data_avg.subject,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm8(:,i) = getfield(data_norm8,features_classes{i});
end
cov_mat_norm8 = cov(mat_norm8);
dlmwrite('normalization8.txt',mat_norm8,',');

%}
%---------------------------------------------------------------------


%Branch 3 Not Normalization of the data 

%Non-Normalization (raw-data)
mat_norm9 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm9(:,i) = getfield(raw_data,features_classes{i});
end
cov_mat_norm9 = cov(mat_norm9);
dlmwrite('nonnormalization9.txt',mat_norm9,',');

      