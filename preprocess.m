function [data_pp] = preprocess(data,classifier,indicator)

% Gray-scale image conversion
% then perform segmentation
numSample = size(data.X,4);
% for i = 1:numSample
%      data_pp.X(:,:,i) = rgb2gray(data.X(:,:,:,i));
% end
% for faster process, skip the grayscale process

if strcmp(indicator,'train')
    load('train_grayscale.mat');
else
    load('test_grayscale.mat');
end

numXpixel = size(data_pp.X,1);
numYpixel = size(data_pp.X,2);

pp_pixel_per_sample = numXpixel*numYpixel;
% row - numSample
% col - pixels per image
data_pp.X = reshape(data_pp.X,[numSample pp_pixel_per_sample]);

% standarize the data
% to get the rid of the factor of exposure difference (hopefully)
% for now just subtract the mean, may divide the variance if necessary
% data_pp_norm = normalizeData(data_pp.X);
% data_pp.X = data_pp_norm;
data_pp.X = double(data_pp.X);
pre_one_hot = data.y;
if (classifier == 'ann')
    data_pp.y = oneHot(pre_one_hot);
else
    data_pp.y = data.y;
end

end
