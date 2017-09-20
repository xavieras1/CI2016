function [ model_data, test_data ] = StandardizeGlobally( model_data, test_data )

%standardize test_data with mean and std. from model_data
test_data.PPE(:) = (test_data.PPE(:) - mean(model_data.PPE(:))) / std(model_data.PPE(:));
test_data.DFA(:) = (test_data.DFA(:) - mean(model_data.DFA(:))) / std(model_data.DFA(:));
test_data.HNR(:) = (test_data.HNR(:) - mean(model_data.HNR(:))) / std(model_data.HNR(:));
test_data.RPDE(:) = (test_data.RPDE(:) - mean(model_data.RPDE(:))) / std(model_data.RPDE(:));
test_data.NHR(:) = (test_data.NHR(:) - mean(model_data.NHR(:))) / std(model_data.NHR(:));
test_data.Shimmer_DDA(:) = (test_data.Shimmer_DDA(:) - mean(model_data.Shimmer_DDA(:))) / std(model_data.Shimmer_DDA(:));
test_data.Shimmer_APQ11(:) = (test_data.Shimmer_APQ11(:) - mean(model_data.Shimmer_APQ11(:))) / std(model_data.Shimmer_APQ11(:));
test_data.Shimmer_APQ5(:) = (test_data.Shimmer_APQ5(:) - mean(model_data.Shimmer_APQ5(:))) / std(model_data.Shimmer_APQ5(:));
test_data.Shimmer_APQ3(:) = (test_data.Shimmer_APQ3(:) - mean(model_data.Shimmer_APQ3(:))) / std(model_data.Shimmer_APQ3(:));
test_data.Shimmer_dB_(:) = (test_data.Shimmer_dB_(:) - mean(model_data.Shimmer_dB_(:))) / std(model_data.Shimmer_dB_(:));
test_data.Shimmer(:) = (test_data.Shimmer(:) - mean(model_data.Shimmer(:))) / std(model_data.Shimmer(:));
test_data.Jitter_DDP(:) = (test_data.Jitter_DDP(:) - mean(model_data.Jitter_DDP(:))) / std(model_data.Jitter_DDP(:));
test_data.Jitter_PPQ5(:) = (test_data.Jitter_PPQ5(:) - mean(model_data.Jitter_PPQ5(:))) / std(model_data.Jitter_PPQ5(:));
test_data.Jitter_RAP(:) = (test_data.Jitter_RAP(:) - mean(model_data.Jitter_RAP(:))) / std(model_data.Jitter_RAP(:));
test_data.Jitter_Abs_(:) = (test_data.Jitter_Abs_(:) - mean(model_data.Jitter_Abs_(:))) / std(model_data.Jitter_Abs_(:));
test_data.Jitter___(:) = (test_data.Jitter___(:) - mean(model_data.Jitter___(:))) / std(model_data.Jitter___(:));
test_data.age(:) = (test_data.age(:) - mean(model_data.age(:))) / std(model_data.age(:));

%standardize model_data
model_data.PPE(:) = (model_data.PPE(:) - mean(model_data.PPE(:))) / std(model_data.PPE(:));
model_data.DFA(:) = (model_data.DFA(:) - mean(model_data.DFA(:))) / std(model_data.DFA(:));
model_data.HNR(:) = (model_data.HNR(:) - mean(model_data.HNR(:))) / std(model_data.HNR(:));
model_data.RPDE(:) = (model_data.RPDE(:) - mean(model_data.RPDE(:))) / std(model_data.RPDE(:));
model_data.NHR(:) = (model_data.NHR(:) - mean(model_data.NHR(:))) / std(model_data.NHR(:));
model_data.Shimmer_DDA(:) = (model_data.Shimmer_DDA(:) - mean(model_data.Shimmer_DDA(:))) / std(model_data.Shimmer_DDA(:));
model_data.Shimmer_APQ11(:) = (model_data.Shimmer_APQ11(:) - mean(model_data.Shimmer_APQ11(:))) / std(model_data.Shimmer_APQ11(:));
model_data.Shimmer_APQ5(:) = (model_data.Shimmer_APQ5(:) - mean(model_data.Shimmer_APQ5(:))) / std(model_data.Shimmer_APQ5(:));
model_data.Shimmer_APQ3(:) = (model_data.Shimmer_APQ3(:) - mean(model_data.Shimmer_APQ3(:))) / std(model_data.Shimmer_APQ3(:));
model_data.Shimmer_dB_(:) = (model_data.Shimmer_dB_(:) - mean(model_data.Shimmer_dB_(:))) / std(model_data.Shimmer_dB_(:));
model_data.Shimmer(:) = (model_data.Shimmer(:) - mean(model_data.Shimmer(:))) / std(model_data.Shimmer(:));
model_data.Jitter_DDP(:) = (model_data.Jitter_DDP(:) - mean(model_data.Jitter_DDP(:))) / std(model_data.Jitter_DDP(:));
model_data.Jitter_PPQ5(:) = (model_data.Jitter_PPQ5(:) - mean(model_data.Jitter_PPQ5(:))) / std(model_data.Jitter_PPQ5(:));
model_data.Jitter_RAP(:) = (model_data.Jitter_RAP(:) - mean(model_data.Jitter_RAP(:))) / std(model_data.Jitter_RAP(:));
model_data.Jitter_Abs_(:) = (model_data.Jitter_Abs_(:) - mean(model_data.Jitter_Abs_(:))) / std(model_data.Jitter_Abs_(:));
model_data.Jitter___(:) = (model_data.Jitter___(:) - mean(model_data.Jitter___(:))) / std(model_data.Jitter___(:));
model_data.age(:) = (model_data.age(:) - mean(model_data.age(:))) / std(model_data.age(:));

end

