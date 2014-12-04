% runs newweights


% calls data
data1;

% generats network from coordinates
networkdist=distancecoordinates(cities{2});


% uses generated data
swag=newweights(populationvector,networkdist,connectionmatrix)

% calulates difference
newweights(populationvector,networkdist,connectionmatrix)-populationvector