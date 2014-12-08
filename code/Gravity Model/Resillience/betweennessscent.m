function [ phi ] = betweennessscent(Network,mean_w)
%betweennessscent Calculates the parameter phi
%   Pre: Network is an adjacency matrix of a network
%   Post: phi is the betweeness centrality

% Commend: Does the same as parameter dT just with the weighted network

n=size(Network);

% calculate lambda:
Lambda=mean_w./Network;

% uses Floyd-Warshall
% since our network is a adjacency matrix a 0 is actually equal to the
% weight infty (at least for shortest path calculation with this algortihm)
for i=1:n
    for j=1:n
        if Lambda(i,j)==0
            Lambda(i,j)=inf;
        end
    end
end



shortest_paths=floyd_warshall(Lambda);



% calculate the diameter

numberofconnections=0;
totalpathlength=0;
for i=1:n
    for j=i+1:n
        numberofconnections=numberofconnections+1;
        totalpathlength=shortest_paths(i,j)+totalpathlength;
    end
end

phi=totalpathlength/numberofconnections;





end

