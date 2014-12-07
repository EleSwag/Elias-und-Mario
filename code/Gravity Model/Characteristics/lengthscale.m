function [r] = lengthscale(Network,distance)
%lengthscale Calculates the length scale parameter
%   Pre: Network is an adjacency matrix of a network
%        distance is a matrix of the same size with the geographical
%        distance of the nodes
%   Post: lengthscale is the parameter r from the table

n=size(Network);


% Calculate Flux
Flux=sum(Network,2);

% define p
p=zeros(n);
for i=1:n
    p(:,i)=Network(:,i)./Flux;
end


% calculating r according to the formula
r=0;
product= p*distance;
for i=1:n
    for j=i:n
        r=product(i,j)+r;
    end
end


end

