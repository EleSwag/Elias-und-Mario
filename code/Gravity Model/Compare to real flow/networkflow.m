function [ Flow ] = networkflow(Population, Network)
% Flow: Calculates flow between different cities (intendified by
%       populations) according to a gravity model theory

% Pre: Population is a n x 1 vector with Populations of cities
%      Network is a represantion of a network in a n x n adjacency matrix

% post: Flow is a n x n matrix where the ij-th entry stands for the
%       normalisize flow from i to j

n=size(Population);

% (simplest) gravitiy function
gravity =@(city1,city2,distance) (city1.*city2)./distance;


% calculationg Flow with the function from above
Flow = zeros(n);
for i=1:n
Flow(:,i)=gravity(Population(i),Population,Network(:,i));
end

% set the Flow from a city to itself to zero(better for further investigations)
for i=1:n
    Flow(i,i)=0;
end

% normalisize
Flow=Flow/norm(Flow);

end

