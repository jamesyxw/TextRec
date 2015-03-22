% CSC2515 Project - Scene Digital Recognition

clear all;
close all;

% load data
train_data = load('train_32x32.mat');
test_data = load('test_32x32.mat');

% Usage: 
% specify one of the following:
% ann, svm, knn
classifier = 'ann';

% Define Parameters
% For ANN
numHidden = 500;
numFvDim = 32*32;
lr = 0.01;
tr_ratio = 0.8;
v_ratio = 0.2;
numEpoch = 1000;

% For KNN
knn_k = 3;
distance = 'euclidean';

% For SVM
% polynomial, ...
kernel = 'rbf';
fprintf('Preprocessing ......\n');
% Preprocess goes here
[train_data_pp] = preprocess(train_data,classifier);
[test_data_pp] = preprocess(test_data,classifier);

% Run classifiers
if classifier == 'ann'
% % ANN
fprintf('Running ANN ......\n');
[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
% data must be in feature vector x numSamples, so do transpose
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
end

if classifier == 'knn'
% KNN
fprintf('Running KNN ......\n');
[pred_lb_knn] = knn(knn_k,train_data_pp.X,train_data_pp.y,test_data_pp.X,distance);
% convert 1 hot coding for ploting the confusion matrix
test_lb_1hot = oneHot(test_data_pp.y);
pred_lb_1hot = oneHot(pred_lb_knn);
% plot confusion matrix - 0 1 2 3 ... 9
plotconfusion(test_lb_1hot',pred_lb_1hot');
%get the test accuracy
test_acc_knn = cal_classify_result(pred_lb_knn,test_data_pp.y);
fprintf('KNN - Test Accuracy: %f\n',test_acc_knn);
end

if classifier == 'svm'
% SVM
fprintf('Running SVM ......\n');
pred_lb_svm = n_svm(train_data_pp.X,train_data_pp.y,test_data_pp.X,kernel,v_ratio);
%get the test accuracy
test_acc_svm = cal_classify_result(pred_lb_svm,test_data_pp.y);
% convert 1 hot coding for ploting the confusion matrix
test_lb_1hot = oneHot(test_data_pp.y);
pred_lb_1hot = oneHot(pred_lb_svm);
% plot confusion matrix - 0 1 2 3 ... 9
plotconfusion(test_lb_1hot',pred_lb_1hot');
fprintf('SVM - Test Accuracy: %f\n',test_acc_svm);
end