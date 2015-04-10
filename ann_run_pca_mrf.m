classifier = 'ann';

% train_data = load('train_32x32.mat');
% test_data = load('test_32x32.mat');
% 
% [train_data_pp] = mrf_preprocess(train_data,classifier,'train');
% save('train_mrf.mat','train_data_pp');
% [test_data_pp] = mrf_preprocess(test_data,classifier,'test');
% save('test_mrf.mat','test_data_pp');

% Define Parameters
% For ANN

load('train_mrf.mat');
load('test_mrf.mat');

lr = 0.01;
tr_ratio = 0.8;
v_ratio = 0.2;
numEpoch = 1000;


%The numHidden for the best classifier
numHidden = [50];

pca_num = 64;
if pca_num ~= 0
    fprintf(char(strcat('PCA...',num2str(pca_num),'......\n')));
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

% load(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')));
% load(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')));

numFvDim = size(train_data_pp.X,2);
fprintf(char(strcat('training...',num2str(pca_num),'......\n')));
tic
[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
toc
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann_mrf',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 
