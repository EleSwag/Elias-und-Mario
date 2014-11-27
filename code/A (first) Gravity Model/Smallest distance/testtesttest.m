% this file contains all the attempts until effective_distance run



% Keep it easy: Starting point 1 aim 2 and just one intermediate node
l=zeros(n-2,n-1);

for j=3:n
    l(j-2,1)=lambda(1,j)+lambda(j,2);
end

% starting point still 1 aim 3 and just one intermediate node

for j=1:n-2
    % have to generate numbers 2,4,...,n
    % l(2,j)=lambda(1,...)+lambda(...,1)
end


% suppose aim is node m, then need numbers 2,...,m-1,m+1,...,n
% probably have to do cases where j<m and j>m
% this works: Starting point 1 and aim m

  
for m=2:n
    
    for j=2:n
        
        if j<m
             l(j-1,m-1)=lambda(1,j)+lambda(j,m);
        end
        
        if j>m
            l(j-2,m-1)=lambda(1,j)+lambda(j,m);
        end
        
    end
    
end

% running over different starting points

l{1}=zeros(n-2,n-1);
for i=2:n
 l={l{1:i-1},zeros(n-2,n-1)};
end


for k=1:n
    
        for m=1:n
            
            if m<k
                for j=1:n
                   
                    if j>k
                         
                         if j<m
                             l{k}(j-1,m)=lambda(k,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{k}(j-2,m)=lambda(k,j)+lambda(j,m);
                         end
            
                     end  
                     
                     if j<k
                         
                         if j<m
                             l{k}(j,m)=lambda(k,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{k}(j-1,m)=lambda(k,j)+lambda(j,m);
                         end
            
                     end 
                    
                
            
                end
            end
            
            if m>k
                 for j=1:n
                     
                     if j>k
                         
                         if j<m
                             l{k}(j-1,m-1)=lambda(k,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{k}(j-2,m-1)=lambda(k,j)+lambda(j,m);
                         end
            
                     end  
                     
                     if j<k
                         
                         if j<m
                             l{k}(j,m-1)=lambda(k,j)+lambda(j,m);
                         end
                    
                         if j>m
                             l{k}(j-1,m-1)=lambda(k,j)+lambda(j,m);
                         end
            
                     end    
                     
                     
                                        
                 end
            end
         
        end
         
end

