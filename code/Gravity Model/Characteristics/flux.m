function [ meanflux ] = flux(Network)
%Flux Calculates the average Flux
%   Pre: Network is an adjacency matrix of a network
%   Post: meanflux is the average Flux

n=size(Network);

meanflux=sum(sum(Network,2)./n(1));


end

