function [data_pp] = preprocess(data,classifier)

% Gray-scale image conversion
% then perform segmentation
hy = fspecial('sobel');
hx = hy';
numSample = size(data.X,4);
for i = 1:numSample
    data_pp.X(:,:,i) = rgb2gray(data.X(:,:,:,i));
%     % sobel edge detection
%     Iy = imfilter(double(data_pp.X(:,:,i)),hy,'replicate');
%     Ix = imfilter(double(data_pp.X(:,:,i)),hx,'replicate');
%     grad_mag = sqrt(Ix.^2+Iy.^2);
%     se = strel('arbitrary',5);
%     % Io = imopen(double(data_pp.X(:,:,i),se));
%     Ie = imerode(data_pp.X(:,:,i),se);
%     Iobr = imreconstruct(Ie,data_pp.X(:,:,i));
%     % Ioc = imclose(Io,se);
%     Iobrd = imdilate(Iobr,se);
%     Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
%     Iobrcbr = imcomplement(Iobrcbr);
%     fgm = imregionalmax(Iobrcbr);
%     se2 = strel(ones(3,3));
%     fgm2 = imclose(fgm,se2);
%     fgm3 = imerode(fgm2,se2);
%     fgm4 = bwareaopen(fgm3,20);
%     bw = im2bw(Iobrcbr,graythresh(Iobrcbr));
%     D = bwdist(bw);
%     DL = watershed(D);
%     bgm = (DL==0);
%     gradmag2 = imimposemin(grad_mag,bgm | fgm4);
%     L = watershed(gradmag2);
%     data_pp.X(:,:,i) = L;
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
data_pp.X = data_pp.X';
data_pp_mean = mean(data_pp.X);
data_pp.X = bsxfun(@minus,double(data_pp.X),data_pp_mean);
data_pp.X = data_pp.X';

pre_one_hot = data.y;
if (classifier == 'ann')
    data_pp.y = oneHot(pre_one_hot);
else
    data_pp.y = data.y;
end

end
