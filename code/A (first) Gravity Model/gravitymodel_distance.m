% Generating Gravity model based on distance

% calls data1
data1;

% run function

% generats network from coordinates
networkdist=distancecoordinates(cities{2});
flow=networkflow(cities{3},networkdist);
flow=flow./10^6;
