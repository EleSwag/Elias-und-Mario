% call data
data1;

networkdist=distancecoordinates(cities{2});
flow=networkflow(cities{3},networkdist);
scale=(boarding+deboarding)./sum(flow.*connectionmatrix)';

% some comments would be nice