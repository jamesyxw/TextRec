function [ test_acc_ann ] = ann_analyze( ann_model, test_data_pp, test_data )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

pred_lb_ann = ann_model.net(double(test_data_pp.X'));
% pred labels are in form of class_pred_prob x numSamples
% find the max indices
[prob_lb,pred_lb_ann] = max(pred_lb_ann);
% convert to one-hot
pred_lb_1hot = oneHot(pred_lb_ann');
% plot the confusion matrix
%plotconfusion(test_data_pp.y',pred_lb_1hot');
% get the test accuracy
test_acc_ann = cal_classify_result(pred_lb_ann',test_data.y);
ann_model.tr;
fprintf('ANN - Test Accuracy: %f\n',test_acc_ann);


end

