function [ numberoflinks ] = links(Network)
%numberoflinks Calculates the number of links in a network
%   Pre: Network is an adjacency matrix of a network
%   Post: numberoflinks is the numberoflinks in the network

n=size(Network);
numberoflinks=0;

for i=1:n
    for j=i:n
        if Network(i,j)~= 0
            numberoflinks=numberoflinks+1;
        end
    end
end



end

