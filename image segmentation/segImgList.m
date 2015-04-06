function outputImgList = segImgList(inputImgList)

    class_number=2;
    potential=0.5;
    maxIter=30;

    listSize = size(inputImgList,4);
    rowDim = size(inputImgList,1);
    colDim = size(inputImgList,2);
    outputImgList = zeros(rowDim,colDim,listSize);
    for i=1:listSize
        I=double(inputImgList(:,:,:,i));
        outputImgList(:,:,i)=ICM(I,class_number,potential,maxIter);
        disp(i);
    end

end