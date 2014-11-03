% first real dataset

%population vector
%population of the 10 biggest citys (Dates 2010 http://de.wikipedia.org/wiki/Liste_der_Städte_in_der_Schweiz)
%+ ?? important node citys????

citynames={'Zuerich',
           'Genf',
           'Basel',
           'Lausanne',
           'Bern',
           'Winterthur',
           'Luzern',
           'St.Gallen',
           'Lugano',
           'Biel',
           'Olten',
           'Arthgoldau'};
%Gallen;Lugano;Biel;node Olten;node Arthgoldau
%order={Zürich;Genf;Basel;Lausanne;Bern;Winterthur;Luzern;St.
%Gallen;Lugano;Biel;node Olten;node Arthgoldau(http://de.wikipedia.org/wiki/Eisenbahnknoten#Schweiz)}

populationvector=[372857;
                  187470;
                  163216;
                  127821;
                  124381;
                  101308;
                  77491;
                  72959;
                  54667;
                  51203;
                  11770;
                  11062];

%connection Matrix

x=inf;

timeconnection=[x x 71 x 65 19 46 x x x 31 38;
                x x x 33 x x x x x x x x;
                71 x x x x x x x x 67 24 x;
                x 33 x x 66 x x x 58 x x x;
                65 x x 66 x x 87 x x 25 35 x;
                19 x x x x x x 38 x x x x;
                50 x x x 87 x x x x x 35 27;
                x x x x x 38 x x x x x 101;
                x x x 58 x x x x x x x 117;
                x x 67 x 25 x x x x x 37 x;
                31 x 24 x 35 x 35 x x 37 x x;
                38 x x x x x 27 101 117 x x x];




