% Generats file for gephi

% Call and generat data
    data1;
    % generats network from coordinates
    networkdist=distancecoordinates(cities{2});
    flow=networkflow(cities{3},networkdist);
    
gravitymatrix=flow.*connectionmatrix;

csvwrite('gravitymatrix.csv',gravitymatrix);