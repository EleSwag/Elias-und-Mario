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
% with infty.. to later find the smallest connection it is better to set it
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
% * The code will have a real bad runtime since it tries every possible
%   combination (binomial running time)


% Idea: x names the starting node
%       k the number of knodes between the starting and ending node
%       l{{x}{k} is a (n-1) x (n-2)!/(n-2-k)! matrix which is interpreted
%       in the following way: The columns represent the ending points with
%       1...'x'...n, where 'x' is removed(see oberservations why this makes
%       sense). The rows are all the possible combinations with k
%       intermediate nodes.






% this works: Starting point 1 and aim m
  
% now have 2 possibileties: Raise number of intermediate nodes or change
% starting node...

% first try other starting nodes...

l{1}=zeros(n-2,n-1);
for i=2:n
 l={l{1:i-1},zeros(n-2,n-1)};
end


for x=1:n
    
        for m=1:n
            
            if m<x
                for j=1:n
                   
                    if j>x
                         
                         if j<m
                             l{x}(j-1,m)=lambda(x,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{x}(j-2,m)=lambda(x,j)+lambda(j,m);
                         end
            
                     end  
                     
                     if j<x
                         
                         if j<m
                             l{x}(j,m)=lambda(x,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{x}(j-1,m)=lambda(x,j)+lambda(j,m);
                         end
            
                     end 
                    
                
            
                end
            end
            
            if m>x
                 for j=1:n
                     
                     if j>x
                         
                         if j<m
                             l{x}(j-1,m-1)=lambda(x,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{x}(j-2,m-1)=lambda(x,j)+lambda(j,m);
                         end
            
                     end  
                     
                     if j<x
                         
                         if j<m
                             l{x}(j,m-1)=lambda(x,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{x}(j-1,m-1)=lambda(x,j)+lambda(j,m);
                         end
            
                     end    
                     
                     
                                        
                 end
            end
         
        end
         
end

% should now work with diffrent starting nodes...
% last extension would be more nodes between....

eff_dist= l;

end

