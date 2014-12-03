function [ Flow ] = networkflow(Population, Network)
%Flow: Wrote a function of our first gravity model, so it will be easier to
% apply different datasets to it.

% Population is a vector with Populations of cities
% Network is the represantion in an adjacency matrix
n=size(Population);

gravity =@(city1,city2,distance) (city1.*city2)./distance;


Flow = zeros(n);
for i=1:n
Flow(:,i)=gravity(Population(i),Population,Network(i,:)');
end

for i=1:n
    for j=1:n
        if Flow(i,j)== inf
            Flow(i,j)=0;
        end
    end
end

Flow=Flow/norm(Flow);

end

