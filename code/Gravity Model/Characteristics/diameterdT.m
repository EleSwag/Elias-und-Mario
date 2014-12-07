function [ dT ] = diameterdT(Network)
%diameterdT Calculates the diameter dT
%   Pre: Network is an adjacency matrix of a network
%   Post: dT is the average shortest path length that connects a pair of
%         nodes

n=size(Network);

% Set all connections to the weight 1
for i=1:n
    for j=1:n
        if Network(i,j)~=0
            Network(i,j)=1;
        end
    end
end

% uses Floyd-Warshall
% since our network is a adjacency matrix a 0 is actuelly equal to the
% weight infty (at least for shortest path calculation with this algortihm)
for i=1:n
    for j=1:n
        if Network(i,j)==0
            Network(i,j)=inf;
        end
    end
end



shortest_paths=floyd_warshall(Network);



% calculate the diameter

numberofconnections=0;
totalpathlength=0;
for i=1:n
    for j=i+1:n
        numberofconnections=numberofconnections+1;
        totalpathlength=shortest_paths(i,j)+totalpathlength;
    end
end

dT=totalpathlength/numberofconnections;



end

