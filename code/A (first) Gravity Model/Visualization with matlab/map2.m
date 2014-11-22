% This script plots the connection network system

% Call and generat data
    data1;

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
 plot_connection(connectionmatrix,cities{2});
