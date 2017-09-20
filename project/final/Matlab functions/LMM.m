function [ LMEtotal, MAEtotal, SDtotal, LMEmotor, MAEmotor, SDmotor ] = LMM( train, test )
%This function fits a linear mixed effects model to the training data and
%then computesn the generalization MAE on the separate test set
%As random effect, a constant term per subject is included

LMEtotal=fitlme(train, 'total_UPDRS~age+sex+Jitter___+Jitter_Abs_+Jitter_RAP+Jitter_PPQ5+Jitter_DDP+Shimmer+Shimmer_dB_+Shimmer_APQ3+Shimmer_APQ5+Shimmer_APQ11+Shimmer_DDA+NHR+HNR+RPDE+DFA+PPE+(1 | subject_)');
ypredtotal = predict(LMEtotal,test);
MAEtotal=mean(abs(test.total_UPDRS-ypredtotal));
SDtotal=std(abs(test.total_UPDRS-ypredtotal));

LMEmotor=fitlme(train, 'motor_UPDRS~age+sex+Jitter___+Jitter_Abs_+Jitter_RAP+Jitter_PPQ5+Jitter_DDP+Shimmer+Shimmer_dB_+Shimmer_APQ3+Shimmer_APQ5+Shimmer_APQ11+Shimmer_DDA+NHR+HNR+RPDE+DFA+PPE+(1 | subject_)');
ypredmotor = predict(LMEmotor,test);
MAEmotor=mean(abs(test.motor_UPDRS-ypredmotor));
SDmotor=std(abs(test.motor_UPDRS-ypredmotor));

end

