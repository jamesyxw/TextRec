function [ output ] = array2str( input_arg )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

a = mat2str(input_arg);
output = strrep(a,'[','_');
output = strrep(output,']','');
output = strrep(output,' ','_');


end

