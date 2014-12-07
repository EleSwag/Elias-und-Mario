% This script calculats the network characteristics according to the table
% 1 on page 591 of the paper 
% 'Complexity in human transportation networkss a comparative analysis 
% of worldwide air transportation and global cargo-ship movements'

% call data
data1;

% generating the different networks
    % generats network from coordinates
    networkdist=distancecoordinates(cities{2});
    networkondist=networkflow(cities{3},networkdist);
    
    % Combine network above with connection matrix
    connectednetwork=networkondist.*connectionmatrix;
    
    
% calculating parameters for table

% Important note: Some of the parameters for the all-connected network
% could als be calculated explicit by applying combinatorics

% second important note: Since our networks are undirected we sum only over
% the upper triangle of the matrix


    % nodes
    n=size(networkondist);
    n=n(1);
    m=size(connectednetwork);
    m=m(1);
    
    % links
    l_n=links(networkondist);
    l_m=links(connectednetwork);
    
    % Network diameter
    sigma_n=2*l_n/n^2;
    sigma_m=2*l_m/m^2;
    
    % mean link weight
    w_n=linkmean(networkondist,l_n);
    w_m=linkmean(connectednetwork,l_m);
    
    % lengthscale
    r_n=lengthscale(networkondist,networkdist);
    r_m=lengthscale(connectednetwork,networkdist);
    
    % diameter phi
    phi_n=betweennessscent(networkondist,w_n);
    phi_m=betweennessscent(connectednetwork,w_m);
    
    
    % diameter dT
    dT_n=diameterdT(networkondist);
    dT_m=diameterdT(connectednetwork);
        
    % average flux
    F_n=flux(networkondist);
    F_m=flux(connectednetwork);
    
    % average node degree
    k_n=averagenode(networkondist);
    k_m=averagenode(connectednetwork);
    
   
    
    
    
   
    
    
    
    
