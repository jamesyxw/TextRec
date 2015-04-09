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

train_data_pp = load('train_mrf.mat');
test_data_pp = load('test_mrf.mat');

lr = 0.01;
tr_ratio = 0.8;
v_ratio = 0.2;
numEpoch = 1000;


%The numHidden for the best classifier
numHidden = [100 100 50];

pca_num = 2;
if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

numFvDim = size(train_data_pp.X,2);

[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 

pca_num = 4;
if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

numFvDim = size(train_data_pp.X,2);

[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 

pca_num = 6;
if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

numFvDim = size(train_data_pp.X,2);

[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 

pca_num = 8;
if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

numFvDim = size(train_data_pp.X,2);

[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 

pca_num = 16;
if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

numFvDim = size(train_data_pp.X,2);

[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 

pca_num = 32;
if pca_num ~= 0
    train_data_pp.X = pca_analysis(train_data_pp.X,pca_num);
    test_data_pp.X = pca_analysis(test_data_pp.X,pca_num);   

	save(char(strcat( 'train_mrf_pca_',num2str(pca_num), '.mat')),'train_data_pp');
	save(char(strcat( 'test_mrf_pca_',num2str(pca_num), '.mat')),'test_data_pp');
end 

numFvDim = size(train_data_pp.X,2);

[net,tr] = ann_train(train_data_pp,test_data_pp,numHidden,numFvDim,lr,numEpoch,tr_ratio,v_ratio);
ann_model=struct();
ann_model.net = net;
ann_model.tr = tr;
save(char(strcat( 'ann',array2str(numHidden),'_pca_', num2str(pca_num), '.mat')), 'ann_model'); 