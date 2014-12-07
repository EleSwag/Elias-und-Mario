function [ linkaverage ] = linkmean(Network,numberoflinks)
%linkaverage Calculates the mean link weight
%   Pre: Network is an adjacency matrix of a network
%        numberoflinks is the number of links in the network
%   Post: linkaverage is the mean link weight of the network

n=size(Network);

totalweight=0;

for i=1:n
    for j=i:n
        totalweight=totalweight+Network(i,j);
    end
end

linkaverage=totalweight/numberoflinks;

end

