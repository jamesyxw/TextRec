classifier = 'ann';

% train_data = load('train_32x32.mat');
% test_data = load('test_32x32.mat');

% [train_data_pp] = mrf_preprocess(train_data,classifier,'train');
% save('train_mrf.mat','train_data_pp');
% [test_data_pp] = mrf_preprocess(test_data,classifier,'test');
% save('test_mrf.mat','test_data_pp');

% Define Parameters
% For ANN
load('train_mrf.mat');
load('train_otsu.mat');
numImg = size(otsuTrainImg,1);
train_data_pp.X = reshape(otsuTrainImg, [numImg 1024]);

load('test_otsu.mat');
load('test_mrf.mat');
numImg = size(otsuTestImg,1);
test_data_pp.X = reshape(otsuTestImg, [numImg 1024]);


lr = 0.01;
tr_ratio = 0.8;
v_ratio = 0.2;
numEpoch = 1000;

pca_num = 0;

if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   
end 

numFvDim = size(train_data_pp.X,2);

numHidden = [];
[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann_otsu',array2str(numHidden),'.mat')), 'ann_model'); 
