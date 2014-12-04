function [ Flow ] = extendednetworkflow(Population, Network)
%idea of the extendedgravity is that the connectivity of a node plays into gravity.


n=size(Population);

extendedgravity =@(city1,city2,distance) (city1.*city2)./distance;
Populationmatrix=Network.*Population;
Distancematrix=Network.*distance;



Flow = zeros(n);
for i=1:n
Flow(:,i)=extendedgravity(rowproduct(i,Populationmatrix),rowprod(?,Populationmatrix),Network(i,:)');
end

for i=1:n
    for j=1:n
        s
        end
    end
end

Flow=Flow/norm(Flow);

end

