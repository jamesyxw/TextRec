function accuracy = cal_classify_result(test_result,test_lb)
    numTest = size(test_result,1);    
    count = sum(test_result(:)==test_lb(:));
    accuracy = count*1.0/numTest;
end