load('test_mrf.mat');
load('test_32x32.mat');

test_accurary = struct();

filename = 'ann10';
load('ann10.mat');
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data)

filename = 'ann50';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann100';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann150';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann200';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann250';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann500';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_100_20';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_100_40';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_100_60';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_100_80';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_100_100';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_100_100_50';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_20_20';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_20_20_20';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_20_20_20_20';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

filename = 'ann_20_20_20_20_20';
load(char(strcat(filename,'.mat')));
test_accurary.(filename) = ann_analyze(ann_model, test_data_pp, test_data);

