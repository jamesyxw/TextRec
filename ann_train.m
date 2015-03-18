%--------------------------------------------------------------------------
% numHidden - row vector, contains layer information
function [net,tr] =  ann_train...
    (train_data,test_data,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio)
%--------------------------------------------------------------------------

%All set, ready to start the training process
%setup the training parameters
net = patternnet(numHidden);
net.inputs{1}.size = numFvDim;
% net.trainFcn = 'traingdx';

net.trainParam.lr = lr;
net.trainParam.epochs = numEpoch;
% Using index to do the training
net.divideFcn = 'divideind';
% Convert one-hot to numerical
numericLabel = zeros(size(train_data.y,1),1);
for i = 1:size(train_data.y,1)
    numericLabel(i,1) = find(train_data.y(i,:) == 1);
end
% Find a good cross-validation dataset
c = cvpartition(numericLabel,'HoldOut',v_ratio);
trainInd = find(training(c)==1);
valInd = find(training(c)==0);
% setup the test-set
test_set_size = size(test_data.X,1);
testInd = (valInd(end)+1):1:(valInd(end)+test_set_size);
% setup the training,validation,test index
net.divideParam.trainInd = trainInd;
net.divideParam.valInd = valInd;
net.divideParam.testInd = testInd;
% net.divideParam.trainRatio = tr_ratio;
% net.divideParam.valRatio = v_ratio;
% net.divideParam.testRatio = t_ratio;
% create the neural-network input/output, combine train and test sets
% note input and targets are both feature x numSamples
nn_train = double([train_data.X;test_data.X]');
nn_target = [train_data.y;test_data.y]';
%view(net);
net = init(net);
[net,tr] = train(net,nn_train,nn_target);

end