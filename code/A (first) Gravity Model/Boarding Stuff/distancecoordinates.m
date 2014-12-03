function [ distancenetwork ] = distancecoordinates(coordinates)
% Calculates the distance between all nodes if coordiantes are given
% (by just applying pythagoras)

n= size(coordinates,1);
distancenetwork=zeros(n);

for i=1:n
    coordinatesprime=zeros(n,2);
    for j=1:2
    coordinatesprime(:,j) = coordinates(i,j)*ones(n,1);    
    end
    
    distancenetwork(:,i) = sqrt(sum((coordinates-coordinatesprime).^2,2));

end