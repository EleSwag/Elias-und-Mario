% This script looks how the shortest distance changes if a node is removed

% call data
data1;

    % generats network from coordinates
    networkdist=distancecoordinates(cities{2});
    network=networkflow(cities{3},networkdist);
    %network=network.*connectionmatrix;
    
    
        
% starting value
l_B=links(network);
w_B=linkmean(network,l_B);
phi_B=betweennessscent(network,w_B);

% remove nodes and save phi in a vector

n=size(network);
n=22;

l=zeros(n,1);
w=zeros(n,1);
phi=zeros(n,1);
reduced_network=zeros(n(1)-1);
for i=1:n
    reduced_network=[network(1:i-1,1:i-1)   network(1:i-1,i+1:n);
                     network(i+1:n,1:i-1)   network(i+1:n,i+1:n)];
    l(i)=links(reduced_network);
    w(i)=linkmean(reduced_network,l(i));
    phi(i)=betweennessscent(reduced_network,w(i));
end

% scale phi with the first value (- to make clear if it grows or shrink)
phi=phi./phi_B-1;

figure
bar(phi);
figure
contour(phi);
title('Resillience');
xlabel('Removed City');
ylabel('Prozentual rise in the diameter phi');

                 
              