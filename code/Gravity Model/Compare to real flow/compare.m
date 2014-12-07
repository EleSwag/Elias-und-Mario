% calls data1
data1;

% run function

% generats network from coordinates
networkdist=distancecoordinates(cities{2});
flow=networkflow(cities{3},networkdist);

flowconnect=flow.*connectionmatrix;
% relative comparison with real data

Flux1=sum(flow,2);
values1=(boarding+deboarding)./Flux1;

Flux2=sum(flowconnect,2);
values2=(boarding+deboarding)./Flux2;