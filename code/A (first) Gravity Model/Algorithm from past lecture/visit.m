function [ Node] = visit(number,Node,network)
%visit Help function for depth-first search
%   number is an integer and colours a n times 1 vector.
n=size(network);
Node(number)=1;
for i=1:n
    if Node(i)==0;
        if network(number,i)~= 0
            Node=visit(i,Node,network);
        end
    end
    
end

