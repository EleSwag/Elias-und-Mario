% This script produces a distance based gravity model map from the swiss
% railnetwork.

% Call and generat data
    data1;
    % generats network from coordinates
    networkdist=distancecoordinates(cities{2});
    flow=networkflow(cities{3},networkdist);
    


% First generat points
    % Problem with labeling... tried to solve it by using colors...it's not
    % that bad but still not so good visable...

for i=1:size(cities{2},1)
plot(cities{2}(i,1),cities{2}(i,2),'*','Color',[1-i/22 0 i/22]);
hold on
end
legend(cities{1},'Location','BestOutSide');
title('City map of switzerland');

% Plot Connections
 plot_connection(flow,cities{2});
