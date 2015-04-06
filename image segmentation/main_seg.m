%clc
%clear

%I=imread('peppers.png');
%I=double(I);
I=double(X(:,:,:,5));
%I_orig=X(:,:,:,1);
%I_double=double(X(:,:,:,1));
class_number=3;
potential=0.5;
maxIter=30;
seg=ICM(I,class_number,potential,maxIter);
figure;
imshow(seg,[1 2]);