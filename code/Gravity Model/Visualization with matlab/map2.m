% This script plots the connection network system (actually only uses
% another adjacency matrix as map1, so look there for detailed
% explanations)

% Call and generat data
    data1;

% First generat points
for i=1:size(cities{2},1)
plot(cities{2}(i,1),cities{2}(i,2),'*','Color',[1-i/22 0 i/22]);
hold on
end
legend(cities{1},'Location','BestOutSide');
title('City map of switzerland');

% Plot Connections 
 plot_connection(connectionmatrix,cities{2},10);
