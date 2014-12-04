function [ Node] = visit(number,Node,network)
%visit Help function for depth-first search in the connectivity function

%Pre: number is an integer
%    colours a n x 1 vector
%    network is n x n adjacency matrix

%Post: Look at connectivity
n=size(network);
Node(number)=1;
for i=1:n
    if Node(i)==0;
        if network(number,i)~= 0
            Node=visit(i,Node,network);
        end
    end
    
end

