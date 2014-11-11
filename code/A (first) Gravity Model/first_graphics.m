% Uses first gravity model function and our first data and makes some
% graphics

% calls data1
data1;

% run function
flow=networkflow(populationvector,timeconnection);

% genearting graphis

% for example pie-chart for the Cities
for i=1:12
    
    figure;
    pie(flow(:,i));
    title(citynames(i));
    
    % Problem: pie ignores the connections where it is 0, so we get wrong
    % naming of the charts-> generate new naming
          citynamesprime=citynames;
         l=1;
        while flow(l,i)== 0
             l=l+1;
            citynamesprime=citynames(l:end); 
        end
    
     for j=(l+1):12
      if flow(j,i)== 0
         citynamesprime=[citynamesprime(1:j-l);citynamesprime(j-l+2:end)];
         l=l+1;
      end
     end
   
    legend(citynamesprime,'Location','BestOutside');
end 

% Piediagramm is good, because at the moment the resulting numbers are too
% big, but the precentual relation holds.

