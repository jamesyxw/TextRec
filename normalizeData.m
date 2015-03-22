function [ dataNorm ] = normalizeData( inputData )
%normalizeData This function will normalize the inputData and output the
%normalization result
%Assume each column is one data sample
%Number of columns is number of data samples

inputMean = mean(double(inputData),2);
inputStd = std(double(inputData),[],2);

inputMean_rep = repmat(inputMean,1,size(inputData,2));
inputStd_rep = repmat(inputStd,1,size(inputData,2));

dataNorm = (double(inputData) - inputMean_rep) ./ inputStd_rep;
end

