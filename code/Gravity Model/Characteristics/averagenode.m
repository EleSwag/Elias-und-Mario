function [ meannode ] = averagenode(Network)
%averagenode Calculates the average node degree
%   Pre: Network is an adjacency matrix of a network
%   Post: meannode is the average node degree

n=size(Network);

nodedegree=0;

for i=1:n
    for j=1:n
        if Network(i,j)~= 0
            nodedegree=nodedegree+1;
        end
    end
end

meannode=nodedegree/n(1);

end

