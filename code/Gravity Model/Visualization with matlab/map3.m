% combination of map1 and map2->picture in the documentation

% Call and generat data
    data1;
    % generats network from coordinates
    networkdist=distancecoordinates(cities{2});
    flow=networkflow(cities{3},networkdist);
    


% First generat points

for i=1:size(cities{2},1)
plot(cities{2}(i,1),cities{2}(i,2),'*');
hold on
end
title('City map of switzerland','Fontsize',20);
xlabel('X-coordinate')
ylabel('Y-coordinate')

% Plot Connections

% scaling factor
 m=max(max(flow,[],1));
 plot_connection(flow.*connectionmatrix,cities{2},m);