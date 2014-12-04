% This script produces a distance based gravity model map from the swiss
% railnetwork and then delets the strongest connections
% It also does nearly everything...the idea is to use part of this code 
% for other scenarios.

% Call and generat data
    data1;
    % generats network from coordinates
    networkdist=distancecoordinates(cities{2});
    flow=networkflow(cities{3},networkdist);
    


% First generat points(for detailed informations look at map1)
for i=1:size(cities{2},1)
plot(cities{2}(i,1),cities{2}(i,2),'*','Color',[1-i/22 0 i/22]);
hold on
end
legend(cities{1},'Location','BestOutSide');
title('City map of switzerland');


% appropriate scaling factor for plot_connection (need it at the bottom
% again)
 max1=max(max(flow,[],1));

 % Plot Connections
 plot_connection(flow,cities{2},max1);
 
 Network=flow;
 
 % constantly delete connection until the network is empty
 n=size(flow);
 
 % boolian parameter which checks that the network is still connected
 connection=1;
 while norm(flow-zeros(n))~= 0 && connection
    % Looking for the present biggest connection
    m = max(max(flow,[],1));
    for i=1:n
        for j=1:n
            if flow(i,j)== m
                % Plots a white line over the existing green line(like
                % deleting
                plot([coordinates(i,1) coordinates(j,1)],[coordinates(i,2) coordinates(j,2)],'Color',[1 1 1],'Linewidth',Network(i,j)/max1*10)
                flow(i,j)=0;
                % pause the hole process, so one gets like a video when and
                % where which connection is deleted
                pause(0.1);
            end             
           
        end
    end
    
    % this for loop checks if there is a isoladet node (function which
    % checks connectivity came up later, it would be more suitable to use 
    % this one here)
    
    for k=1:n
        if norm(flow(:,k)) == 0
        connection=0;
        % Gives output in the command line which node is isolated.
        disp('The isolated node is ');
        disp(char(cities{1}(k)));
            
        end
    end
 end
 
 
 
 
 % plots a new figure with the isolated node
 figure
 for i=1:size(cities{2},1)
plot(cities{2}(i,1),cities{2}(i,2),'*','Color',[1-i/22 0 i/22]);
hold on
end
legend(cities{1},'Location','BestOutSide');
title('City map of switzerland');
plot_connection(flow,cities{2},max1);
