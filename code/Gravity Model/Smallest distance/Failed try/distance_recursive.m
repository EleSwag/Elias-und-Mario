function [l] = distance_recursive(Network)
% It seems that the problem for more than one indermediate code is best
% solvable with recursion.

% Define data space
n=size(Network,1);
lambda=zeros(n);
% first calculate average node weight
w_average= sum(sum(Network))/n;

% define lambda
lambda=w_average./Network;

% starting value of the network in the diagonal is always 0, so we will end
% with infty.. to later find the smallest connection it is better to set it
% to 0

for i=1:n
    lambda(i,i)=0;
end

% First again try to implement just one intermediate node with starting
% node x
% m is the aim node
% j is the intermediate node


l{1}=zeros(n-2,n-1);
for i=2:n
 l={l{1:i-1},zeros(n-2,n-1)};
end

for x=1:n

    for m=1:n
     
     %for n=1:?
  
            if m<x
                l{x}(:,m)=matrixreduction(x,m,lambda);       
                
            end
            if m>x                               
               l{x}(:,m-1)=matrixreduction(x,m,lambda);  
            end
    end
    
    
    
end
end

