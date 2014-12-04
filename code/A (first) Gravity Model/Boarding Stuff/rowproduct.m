function [ rowproduct ] = rowproduct( matrix,row )
%rowproduct
%   calculates the product of all nonzero items in a row
n=size(matrix)%odr lenght???
rowproduct=1;
for i=1:n
    if(matrix(row,i)~=0
        rowproduct=rowproduct*matrix(row,i)
        
rowproduct;      
end

