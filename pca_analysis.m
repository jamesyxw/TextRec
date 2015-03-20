%input: row-sample, column - feature vectors
function data_pca = pca_analysis(data,pca_num)
V = pca(data);
V = V(:,1:pca_num);
data_pca = data*V;
end