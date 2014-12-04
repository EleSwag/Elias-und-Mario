function [ swagweights ] = newweights(population,distance_network,connected_network)
% newweights
% Tried to implement that we were talking about at the mobile phone
% (or at least in the way I understood it)

% pre
% population is a n x 1 vector
% distance network is a n x n adjacency matrix with the geographical
% distance
% connected network is also a n x n adjacency matrix with 1 (connected)<->0
% not connected

% post
% swagweights which are determinted not only by the population from a city
% but as well from the population of the connected cities.
% optimal distance from the other cities is also berücksichtigt.

n=size(population);
blub=zeros(n);

for i=1:n
    blub(:,i)=connected_network(:,i).*population./distance_network(:,i);
end

% diagonal is Nan since geographical distace is equal 0... so set it back
% to the orgin value

for j=1:n
    blub(j,j)=population(j);
end


swagweights=sum(blub,2);

end

