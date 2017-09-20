%CI The Parkinson Project

%The main function of this script is to generate different types of
%datasets in order to analyze the correlation of the variables to perform
%Principal Components Analysis and other methods to main only relevant
%features of the medical data set.

close all; clc;

filePath = 'parkinson.csv';

parkinson = importdata(filePath);

fields = {'subject';'age';'sex';'test_time';'motor_UPDRS';'total_UPDRS';'jitter_percentage';'jitter_ABS';'jitter_RAP';'jitter_PPQ5';'jitter_DDP';'shimmer';'shimmer_DB';'shimmer_APQ3';'shimmer_APQ5';'shimmer_APQ11';'shimmer_DDA';'NHR';'HNR';'RPDE';'DFA';'PPE'};    

raw_data = struct();
for i=1:size(parkinson.data,2)
    raw_data = setfield(raw_data,fields{i},parkinson.data(:,i));
end

%Normalization 1 Mean considering data from every individual
data_norm1 = normalizeMedData(raw_data,1);
mat_norm1 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm1(:,i) = getfield(data_norm1,fields{i});
end
cov_mat_norm1 = cov(mat_norm1);
dlmwrite('normalization1.txt',mat_norm1,',');

%Normalization 2 Mean considering data from all individuals
data_norm2 = normalizeMedData(raw_data,2);
mat_norm2 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm2(:,i) = getfield(data_norm2,fields{i});
end
cov_mat_norm2 = cov(mat_norm2);
dlmwrite('normalization2.txt',mat_norm2,',');

%Normalization 3 Mean considering the gender of individuals
data_norm3 = normalizeMedData(raw_data,3);
mat_norm3 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm3(:,i) = getfield(data_norm3,fields{i});
end
cov_mat_norm3 = cov(mat_norm3);
dlmwrite('normalization3.txt',mat_norm3,',');

%Normalization 4 Ponderated Value considering all individuals
data_norm4 = normalizeMedData(raw_data,4);
mat_norm4 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm4(:,i) = getfield(data_norm4,fields{i});
end
cov_mat_norm4 = cov(mat_norm4);
dlmwrite('normalization4.txt',mat_norm4,',');

%Normalization 5 Ponderated Value considering every individual
data_norm5 = normalizeMedData(raw_data,5);
mat_norm5 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm5(:,i) = getfield(data_norm5,fields{i});
end
cov_mat_norm5 = cov(mat_norm5);
dlmwrite('normalization5.txt',mat_norm5,',');

%Normalization 6 Ponderated Value considering gender of individuals
data_norm6 = normalizeMedData(raw_data,6);
mat_norm6 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm6(:,i) = getfield(data_norm6,fields{i});
end
cov_mat_norm6 = cov(mat_norm6);
dlmwrite('normalization6.txt',mat_norm6,',');

%Non-Normalization (raw-data)
mat_norm7 = zeros(size(parkinson.data,1),size(parkinson.data,2));
for i=1:size(parkinson.data,2)
    mat_norm7(:,i) = getfield(raw_data,fields{i});
end
cov_mat_norm7 = cov(mat_norm7);
dlmwrite('no_normalization7.txt',mat_norm7,',');

      