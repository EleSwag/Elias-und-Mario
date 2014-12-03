% call data
data1;
flow=networkflow(cities{3},networkdist);
scale=(boarding+deboarding)./((sum((flow.*connectionmatrix))');