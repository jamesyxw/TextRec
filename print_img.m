%displayImgList1024(train_data_pp.X(1,:),'mrf')

imgIndex = {};

    
for i = 1: 5
   imgIndex{i} = randi(73257); 
    
end


% load('train_32x32.mat');
% originTrainImg = X;
% load('train_grayscale.mat');
% grayTrainImg = data_pp.X;
% load('train_mrf.mat');
% mrfTrainImg = train_data_pp.X;
% load('train_otsu.mat');




displayImg1024(originTrainImg, grayTrainImg, mrfTrainImg, otsuTrainImg, imgIndex);