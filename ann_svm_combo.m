
v_ratio = 0.2;
kernel = 'linear';

load('ann50.mat');

load('train_mrf.mat');
load('train_32x32.mat'); 
train_ann_pred = struct();
train_ann_pred.X = ann_model.net(double(train_data_pp.X'))';
train_ann_pred.y = y;
save('output_from_net_train.mat','train_ann_pred');

load('test_32x32.mat'); 
load('test_mrf.mat');
test_ann_pred = struct();
test_ann_pred.X = ann_model.net(double(test_data_pp.X'))';
test_ann_pred.y = y;
save('output_from_net_test.mat','test_ann_pred');

fprintf('Running SVM ......\n');
pred_lb_svm = n_svm_holdout(train_ann_pred.X,train_ann_pred.y,test_ann_pred.X,kernel,v_ratio);
%get the test accuracy
test_acc_svm = cal_classify_result(pred_lb_svm,test_ann_pred.y);
% convert 1 hot coding for ploting the confusion matrix
test_lb_1hot = oneHot(test_ann_pred.y);
pred_lb_1hot = oneHot(pred_lb_svm);
% plot confusion matrix - 0 1 2 3 ... 9
plotconfusion(test_lb_1hot',pred_lb_1hot');
fprintf('SVM - Test Accuracy: %f\n',test_acc_svm);