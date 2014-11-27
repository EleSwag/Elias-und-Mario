% first real dataset

% population vector
% population of the 10 biggest citys 
% + 2 important nodes(Olten+ Arth-Goldau)
% http://de.wikipedia.org/wiki/Eisenbahnknoten#Schweiz
% http://de.wikipedia.org/wiki/Liste_der_Städte_in_der_Schweiz

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
           'Thun',
           'Koeniz',
           'La Chaux-de-Fonds',
           'Schaffhausen',
           'Freiburg',
           'Chur',
           'Neuenburg',
           'Vernier',
           'Uster',
           'Sion',
           'Olten',
           'Arthgoldau'};

   

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
                  42623;
                  38823;
                  37504;
                  34943;
                  34897;
                  33756;
                  33054;
                  32844;
                  32265;
                  30363;                              
                  11770;
                  11062];

% connection Matrix

% one way via timeconnections
x=inf;

timeconnection=[x x 71 x 65 19 46 x x x 31 38;
                x x x 33 x x x x x x x x;
                71 x x x x x x x x 67 24 x;
                x 33 x x 66 x x x x 58 x x;
                65 x x 66 x x 87 x x 25 35 x;
                19 x x x x x x 38 x x x x;
                50 x x x 87 x x x x x 35 27;
                x x x x x 38 x x x x x 101;
                x x x x x x x x x x x 117;
                x x 67 58 25 x x x x x 37 x;
                31 x 24 x 35 x 35 x x 37 x x;
                38 x x x x x 27 101 117 x x x];
            
  % Other way by using geographicial distance, try to implement with
  % coordinates: We use the swiss coordinat
  % system (http://de.wikipedia.org/wiki/Schweizer_Landeskoordinaten)
  
  % Comment: Since all values are in the same scaling it doesn't matter
  % that we use coordiantes instead of distance in km.
  
  coordinates = [683248 , 248161;
                 500532 , 117325;
                 611587 , 267423;
                 538200 , 152026;
                 600000 , 200000;
                 698805 , 261852;
                 665450 , 211356;
                 746265 , 254310;
                 718030 , 96560;
                 585481 , 220742;
                 614620 , 178664;
                 598221 , 197101;
                 553419 , 216894;
                 689677 , 283948;
                 578943 , 183921;
                 759742 , 190895;
                 561352 , 204483;
                 496673 , 117390;
                 696755 , 245077;
                 594446 , 120213;
                 635447 , 244826;
                 684427 , 211377];            
            
 % Definie all properties in a cell array


cities={citynames,coordinates, populationvector};

connectionmatrix =[
0 0 1 0 1 1 1 0 0 0 0 0 0 1 0 1 0 0 1 0 1 1;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0;
0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0;
1 0 0 0 0 0 1 0 0 1 1 1 0 0 1 0 1 0 0 0 1 0;
1 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 1;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
0 0 1 0 1 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 1 0;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0;
1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 1 1 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0;
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
1 0 1 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
1 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0];

