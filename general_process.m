% CSC2515 Project - Scene Digital Recognition

clear all;
close all;

% load data
train_data = load('train_32x32.mat');
test_data = load('test_32x32.mat');

% Define Parameters
% For ANN
numHidden = 10;
numFvDim = 32*32*3;
lr = 0.01;
tr_ratio = 0.8;
v_ratio = 0.2;
numEpoch = 1000;

% For KNN
knn_k = 3;
distance = 'euclidean';

% For SVM

% Preprocess goes here
[train_data_pp] = preprocess(train_data,'ann');
[test_data_pp] = preprocess(test_data,'ann');

% Run classifiers
% ANN
[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
pred_lb_ann = predict(net,test_data_pp.X);
plotconfusion(test_data_pp.y,pred_lb_ann);
test_acc_ann = cal_classify_result(pred_lb_ann,test_data_pp.y);

% KNN
[pred_lb_knn] = knn(knn_k,train_data_pp,test_data_pp,distance);
plotconfusion(test_data_pp.y,pred_lb_knn);
test_acc_knn = cal_classify_result(pred_lb_knn,test_data_pp.y);

% SVM

