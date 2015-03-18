function [train_data_pp] = preprocess(data,classifier)

if(classifier == 'ann')
train_data_pp = oneHot(data);
           
    
end


end
