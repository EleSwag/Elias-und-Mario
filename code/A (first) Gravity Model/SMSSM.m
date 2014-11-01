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

populationvector={372857;187470;163216;127821;124381;101308;77491;72959;54667;51203;1770;11062};





