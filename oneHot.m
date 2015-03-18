function [ oneHotLabels ] = oneHot( labels )
%oneHot - This function takes a label vector n by 1 and create a one-hot
%encoding of this vector

labelValues = unique(labels);
classNum = length(labelValues);
sampleNum = size(labels,1);

oneHotLabels = zeros(sampleNum, classNum);

for i=1:classNum
   oneHotLabels(:,i) = (labels == labelValues(i));
end


end

