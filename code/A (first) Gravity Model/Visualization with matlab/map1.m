% This script produces a distance based gravity model map from the swiss
% railnetwork.

% Call and generat data
data1;
% generats network from coordinates
networkdist=distancecoordinates(cities{2});
flow=networkflow(cities{3},networkdist);
    


% First generat points
    % Problem with labeling... tried to solve it by using colors...it's not
    % that bad but still not so good visable...but acctually one could drop
    % this since one sees were the points lie so it's more or less clear
    % which node is which city. It is also in a way overloaded with the
    % labelings.

for i=1:size(cities{2},1)
    % as mentioned scaled colors for the diffrent cities, put finally it
    % isn't so good visable as expected or hoped at the beginning
    plot(cities{2}(i,1),cities{2}(i,2),'*','Color',[1-i/22 0 i/22]);
    hold on
end
legend(cities{1},'Location','BestOutSide');
title('City map of switzerland');

% Plot Connections

% scaling factor
 m=max(max(flow,[],1));
 
 
 plot_connection(flow,cities{2},m);
