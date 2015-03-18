%--------------------------------------------------------------------------
% numHidden - row vector, contains layer information
function [net,tr] =  ann_train...
    (train_data,test_data,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio)
%--------------------------------------------------------------------------
%All set, ready to start the training process
%10 NN gives good performance
net = patternnet(numHidden);
net.inputs{1}.size = numFvDim;
% net.trainFcn = 'traingdx';

net.trainParam.lr = lr;
net.trainParam.epochs = numEpoch;

net.divideFcn = 'divideblock';
numericLabel = zeros(size(train_data.y,1),1);
for i = 1:size(train_data.y,1)
    numericLabel(i,1) = find(train_data.y(i,:) == 1);
end

c = cvpartition(numericLabel,'HoldOut',v_ratio);
trainInd = find(training(c)==1);
valInd = find(training(c)==0);
% all_size = tr_size + v_size + t_size;
% [trainInd,valInd,testInd] = ...
%      divideind(all_size,1:tr_size,(tr_size+1):(tr_size+v_size),(tr_size+v_size+1):(tr_size+v_size+t_size));
net.divideParam.trainInd = trainInd;
net.divideParam.valInd = valInd;
% net.divideParam.testInd = testInd;
% net.divideParam.trainRatio = tr_ratio;
% net.divideParam.valRatio = v_ratio;
% net.divideParam.testRatio = t_ratio;

%view(net);
net = init(net);
[net,tr] = train(net,double(train_data.X'),train_data.y');

% view(net_new);
% plotperform(tr);
end