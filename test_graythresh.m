grayImgs = load('train_grayscale.mat')


level = graythresh(I);
BW = im2bw(I,level);
imshow(BW)