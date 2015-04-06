function [ data_pp ] = mrf_preprocess( data,classifier,indicator )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%data_pp.X = segImgList(data.X);

if strcmp(indicator,'train')
    %save('train_mrf.mat','data_pp');
    load('train_mrf.mat');
else
    %save('test_mrf.mat','data_pp');
    load('test_mrf.mat');
end
numSample = size(data.X,4);
numXpixel = size(data_pp.X,1);
numYpixel = size(data_pp.X,2);

pp_pixel_per_sample = numXpixel*numYpixel;
% row - numSample
% col - pixels per image
data_pp.X = reshape(data_pp.X,[pp_pixel_per_sample numSample]);
data_pp.X = data_pp.X';

pre_one_hot = data.y;
if (classifier == 'ann')
    data_pp.y = oneHot(pre_one_hot);
else
    data_pp.y = data.y;
end


end

