% collection of all used data

% all n x 1 vectors have the same size and sequence

% citynames from the 20 biggest cities in Switzerland + additional importan
% nodes(Olten and Arthgoldau)

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

% populations   

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

% connection Matricies

% first we only had 10 cities, we looked up on SBB.ch the connections
% between the cities as a first distance indicator
x=0;

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

% same idea as in the timeconnection: Looked up on the internet if two
% nodes are directly connected or not. But this time we only looked if yes
% or no since we combined this with the geographical distance

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


% additional information we got from the SBB-workers
% boarding tells how many people arrive at this station
% deboarding how many people leave at this station per day
% We will use this information to compare the real results with the one we
% get from the gravity model

boarding=[181900;
           28300;
           49500;
           43200;
           57800;
           44300;
           37200;
           19000;
               0;
           20100;
               0;
               0;
               0;
               0;
               0;
               0;
               0;
               0;
               0;
               0;
           33300;
               0];
 
deboarding=[178300;
             27200;
             47200;
             42600;
             55900;
             43300;
             36700;
             18800;
                 0;
             19500;
                 0;
                 0;
                 0;
                 0;
                 0;
                 0;
                 0;
                 0;
                 0;
             34500;
                0];