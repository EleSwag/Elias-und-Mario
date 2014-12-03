function [l]=matrixreduction(startingpoint,endingpoint,network)
 
x=startingpoint;
m=endingpoint;
lambda=network;

n=size(network,1);

l=zeros(n-2,1);


if m<x
            % cuts the connection to the starting point out and the m-th row
            startingnodeaway{x}=[lambda(1:m-1,1:x-1)    lambda(1:m-1,x+1:n);
                                 lambda(m+1:x-1,1:x-1)  lambda(m+1:x-1,x+1:n);
                                 lambda(x+1:n,1:x-1)    lambda(x+1:n,x+1:n)];
                             
            % cuts the connection to the ending point out and the m-th column
            endingnodeaway{x}=[lambda(1:m-1,1:m-1)  lambda(1:m-1,m+1:x-1) lambda(1:m-1,x+1:n);
                               lambda(m+1:n,1:m-1)  lambda(m+1:n,m+1:x-1) lambda(m+1:n,x+1:n)];
                             
            for j=1:n-2                   
                  l(j)=endingnodeaway{x}(x-1,j)+startingnodeaway{x}(j,m);
            end
             
     
end
                     
        
        if m>x
            % cuts the connection to the starting point out and the m-th row
            startingnodeaway{x}=[lambda(1:x-1,1:x-1)    lambda(1:x-1,x+1:n);
                                 lambda(x+1:m-1,1:x-1)  lambda(x+1:m-1,x+1:n);
                                 lambda(m+1:n,1:x-1)    lambda(m+1:n,x+1:n)];
                             
            % cuts the connection to the ending point out and the m-th column
            endingnodeaway{x}=[lambda(1:m-1,1:x-1)  lambda(1:m-1,x+1:m-1) lambda(1:m-1,m+1:n);
                               lambda(m+1:n,1:x-1)  lambda(m+1:n,x+1:m-1) lambda(m+1:n,m+1:n)];
         
            
                           
         for j=1:n-2
              l(j)=endingnodeaway{x}(x,j)+startingnodeaway{x}(j,m-1);
         end
       
        end



end

