% First attempt of a gravity model
% First we will try to keep it really smiple:
% Only index of a city is its population
% the distance is determined by the time it takes to travel by train 
% (shortest one)
% later we will try to take more factors in account just like
% acctractiviness of a city etc



% Vector of population of the 10 biggest cities:

Pop=[100 10 1]';

n=size(Pop);
% The network is presented by adjacency matrix
Net =[inf 3 1;3 inf 2;1 2 inf];

% simplest gravity model function
gravity =@(city1,city2,distance) (city1.*city2)./distance;

% Important: If there is no connection or it is the city itself set
% distance to infty(=inf in matlab), so the resulting flow is 0

Flow = zeros(n);
for i=1:n
Flow(:,i)=gravity(Pop(i),Pop,Net(i,:)');
end
Flow

% explanation: The i-th row gives the Flow from city i to the other cities
% (this is at the moment symmetric)

%population vector
%population of the 10 biggest citys (Dates 2010 http://de.wikipedia.org/wiki/Liste_der_Städte_in_der_Schweiz)
%+ ?? important node citys????
%order={Zürich;Genf;Basel;Lausanne;Bern;Winterthur;Luzern;St.
%Gallen;Lugano;Biel;node Olten;node Arthgoldau(http://de.wikipedia.org/wiki/Eisenbahnknoten#Schweiz)}

populationvector=[372857;187470;163216;127821;124381;101308;77491;72959;54667;51203;1770;11062];

%connection Matrix

timeconnection=[0 x 71 x 65 19 46 x x x 31 38;x 0 x 33 x x x x x x x x;71 x 0 x x x x x x 67 24 x;x 33 x 0 66 x x x 58 x x x;65 x x 66 0 x 87 x x 25 35 x;19 x x x x 0 x 38 x x x x;50 x x x 87 x 0 x x x 35 27;x x x x x 38 x 0 x x x 101;x x x 58 x x x x 0 x x 117;x x 67 x 25 x x x x 0 37 x;31 x 24 x 35 x 35 x x 37 0 x;38 x x x x x 27 101 117 x x 0];




