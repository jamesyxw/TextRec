function [ img ] = printImg32by32(originImg, grayImg, mrfImg, imgIndex)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

numImgRow = length(imgIndex);
numImgPerRow = 3;
[originX originY] = size(originImg(1,:,:));
[grayX grayY] = size(grayImg(1,:,:));
[mrfX mrfY] = size(mrfImg(1,:,:));

% assert(originX == 32, 'originX not 32');
% assert(originY == 32, 'originY not 32');
% assert(grayX == 32, 'grayX not 32');
% assert(grayY == 32, 'grayY not 32');
% assert(mrfX == 32, 'mrfX not 32');
% assert(mrfY == 32, 'mrfY not 32');


for i=1:numImgRow
   %originImg = reshape(imageList(i,:),[32 32]);
   subplot(numImgRow, numImgPerRow,1+(i-1)*3);
   imshow(originImg(:,:,:,imgIndex{i})); 
   
   
   subplot(numImgRow, numImgPerRow,2+(i-1)*3);
   gray = reshape(grayImg(imgIndex{i},:),[32 32]);
   imshow(gray, [0 255]);
   
   
   subplot(numImgRow, numImgPerRow,3+(i-1)*3);
   mrf = reshape(mrfImg(imgIndex{i},:),[32 32]);
   imshow(mrf, [1 2]); 
end


end

