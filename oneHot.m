function [ oneHotLabels ] = oneHot( labels )
%oneHot - This function takes a label vector n by 1 and create a one-hot
%encoding of this vector

numSample = size(labels,1);

for i = 1:numSample
    switch labels(i)
        case 10
            oneHotLabels(i,:) = [1 0 0 0 0 0 0 0 0 0];
        case 1
            oneHotLabels(i,:) = [0 1 0 0 0 0 0 0 0 0];
        case 2
            oneHotLabels(i,:) = [0 0 1 0 0 0 0 0 0 0];
        case 3
            oneHotLabels(i,:) = [0 0 0 1 0 0 0 0 0 0];
        case 4
            oneHotLabels(i,:) = [0 0 0 0 1 0 0 0 0 0];
        case 5
            oneHotLabels(i,:) = [0 0 0 0 0 1 0 0 0 0];
        case 6
            oneHotLabels(i,:) = [0 0 0 0 0 0 1 0 0 0];
        case 7
            oneHotLabels(i,:) = [0 0 0 0 0 0 0 1 0 0];
        case 8
            oneHotLabels(i,:) = [0 0 0 0 0 0 0 0 1 0];
        case 9
            oneHotLabels(i,:) = [0 0 0 0 0 0 0 0 0 1];
        otherwise
            fprintf('Error One Hot Conversion - Unknown\n');
    end
end
end
