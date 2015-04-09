function [ output_args ] = displayImgList1024( imageList)
%   This function will display the images contained in the imageList
%   imageList must has dimension of N by 1024
%   N: the number of image
%   1024 is the number of pixel that can be reshaped to 32 by 32. 

numImg = size(imageList,1);
numImgPerRow = 4;

numImgLastRow = mod(numImg, numImgPerRow);
if numImgLastRow == 0 & numImg~= 0
    numImgRow = numImg/numImgPerRow;
else
    numImgRow = (numImg - numImgLastRow)/numImgPerRow+1;
end

for i=1:numImg
   originImg = reshape(imageList(i,:),[32 32]);
   subplot(numImgRow, numImgPerRow,i);
   imshow(originImg); 
end

end

