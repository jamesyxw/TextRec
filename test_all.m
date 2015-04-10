pred_lb_ann = net(double(test_data_pp.X'));
% pred labels are in form of class_pred_prob x numSamples
% find the max indices
[prob_lb,pred_lb_ann] = max(pred_lb_ann);
% convert to one-hot
pred_lb_1hot = oneHot(pred_lb_ann');
% plot the confusion matrix
plotconfusion(test_data_pp.y',pred_lb_1hot');
% get the test accuracy
test_acc_ann = cal_classify_result(pred_lb_ann',test_data.y);
tr
fprintf('ANN - Test Accuracy: %f\n',test_acc_ann);