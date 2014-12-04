function [b] = connectivity(Network)
%connectivity: Checks if the network is still connected

% Pre: Network is an adacency matrix

% Post: A boolian parameter if the network is connected or not


% Uses depth-first search

n=size(Network);

% indicator if the node is visited or not
Node=zeros(n,1);

% boolian indicator: b=true network connected <-> b=false network not
%                                                         connected
b=false;

% Checks if the first node has at least one connection, else there will be
% a failure in the while loop
testisolated=sum(Network,2);

if testisolated(1)==0
    return
end


% finds the first connection of the first node (could pick any node you
% want, just for obvious reason take forst one)
j=1;
while Network(1,j)==0
    j=j+1;
end

% enters the recursion
Node=visit(j,Node,Network);

% checks if all nodes were visited at the end, if so b becomes true
if sum(Node)==n
    b=true;
end

end

    
    



