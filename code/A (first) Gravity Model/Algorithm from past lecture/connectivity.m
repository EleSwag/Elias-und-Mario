function [b] = connectivity(Network)
%connectivity: Checks if the network is still connected

% Uses depth-first search

n=size(Network);

% indicator if the node is visited or not
Node=zeros(n,1);

b=false;

testisolated=sum(Network,2);

if testisolated(1)==0
    return
end

    
j=1;
while Network(1,j)==0
    j=j+1;
end

Node=visit(j,Node,Network);

if sum(Node)==n
    b=true;
end

end

    
    



