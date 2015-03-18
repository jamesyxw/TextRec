function [train_data_pp] = preprocess(data,classifier)

train_data_pp = data;

if(classifier == 'ann' || classifier == 'knn')
    train_data_pp = oneHot(data);
end

end
