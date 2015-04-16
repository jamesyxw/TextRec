function [result] = n_svm(TrainingSet,TrainingLabel,TestSet,kf,v_ratio)

    u=unique(TrainingLabel);
    numClasses=length(u);
    
    t = templateSVM('Standardize',1,'KernelFunction',kf);
    % ,'Crossval','on'
    % mdl = fitcecoc(TrainingSet,TrainingLabel,'Learners',t);    
    %isLoss = resubLoss(mdl);
    %fprintf('svm: training sample generalization acc: %f\n',1-isLoss);
    %----------------------------------------------------------------------
    %cross-validated SVM
    c = cvpartition(TrainingLabel,'HoldOut',v_ratio);
    cvmdl = fitcecoc(TrainingSet,TrainingLabel,'Learners',t,'Crossval','on','CVPartition',c); 
    mdl = cvmdl.Trained{1};
    result = predict(mdl,TestSet);
%     label = kfoldPredict(cvmdl);
%     acc = getClassifyAcc(label,TrainingLabel);
%     fprintf('svm: out-of-sample acc after cross validation: %f\n',acc);
%     result = [];
    %----------------------------------------------------------------------
     % result = predict(mdl,TestSet);
    %----------------------------------------------------------------------
%   libSVM implementation
%     model = svmtrain([],TrainingLabel,TrainingSet,'-t 2');
%    [result,acc,dec_values] = svmpredict(test_lb,TestSet,model);
end