function [eff_dist]= effective_distance(Network)
% Network is a given network in a adjacency matrix(symmetric,undirected)
% Referring to 'Complexity in human transportation networks:
% a comparative analysis of wordwide air transportation and global cargoe-ship movement'
% we calculate the effective distance by the formula given on page 592/593.

% Definie data space
n=size(Network,1);
lambda=zeros(n);
% first calculate average node weight
w_average= sum(sum(Network))/n;

% define lambda
lambda=w_average./Network;

% starting value of the network in the diagonal is always 0, so we will end
% with infty.. to later find the smalles connection it is better to set it
% to 0
for i=1:n
    lambda(i,i)=0;
end


% now hard point
% Observations:
% * With 0 intermediate knot we are done.
% * first try with just one intermediate knot...
% * since there are no negative weights there is no use by going back and
%   forth.
% * Also since it is a undirected symmetric network A-B-C gives the same
%   result as all its permutations. <-- WRONG in many ways
%   Better: A-B-C gives the same as C-B-A ;-)








eff_dist= .....;

end

