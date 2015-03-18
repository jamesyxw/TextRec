function [data_pp] = preprocess(data,classifier)

% Gray-scale image conversion
numSample = size(data.X,4);
for i = 1:numSample
    data_pp.X(:,:,i) = rgb2gray(data.X(:,:,:,i));
end

numXpixel = size(data_pp.X,1);
numYpixel = size(data_pp.X,2);

pp_pixel_per_sample = numXpixel*numYpixel;
% row - numSample
% col - pixels per image
data_pp.X = reshape(data_pp.X,[numSample pp_pixel_per_sample]);

pre_one_hot = data.y;
if (classifier == 'ann')
    data_pp.y = oneHot(pre_one_hot);
else
    data_pp.y = data.y;
end

end
