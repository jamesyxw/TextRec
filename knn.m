function [pred_label] = knn(k,train_data,train_targets,test_data,distance)
    
    mdl = fitcknn(train_data,train_targets,'NumNeighbors',k,'Distance',distance);
    mdl.Distance = distance;
    pred_label = predict(mdl,test_data);
end
        
        