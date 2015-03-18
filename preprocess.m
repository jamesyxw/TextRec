function [train_data_pp] = preprocess(data,classifier)

train_data_pp.X = data.X;
train_data_pp.y = data.y;
[numXpixel,numYpixel,numChannel,numSample] = size(data.X);
pp_pixel_per_sample = numXpixel*numYpixel*numChannel;
train_data_pp.X = reshape(data.X,[numSample pp_pixel_per_sample]);
pre_one_hot = data.y;

if (classifier == 'ann')
    train_data_pp.y = oneHot(pre_one_hot);
end

end
