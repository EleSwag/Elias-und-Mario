function  plot_connection(Network,Coordinates)
% Coordiantes are the x-y-Coordinates of the the nodes 
% Network is a adjacency matrix of a network and the funktion plots the 
% connection in a coordinate system.
% Note that the matrix should be symmetric e.g. from a undirected network

% for the strength we set the maximal to 1 and all the other in relation to
% it

% Big Problem with line strength/color but it is also difficult with the
% given Network, since all values exept a few are really small and then
% there are also a lot of connection which make the figure unreadable...

m = max(max(Network,[],1));

n=size(Network,1);

for i=1:n
    for j=i:n
        if Network(i,j)~=0
        plot([Coordinates(i,1) Coordinates(j,1)],[Coordinates(i,2) Coordinates(j,2)],'Color',[0 1-Network(i,j)/m 0],'Linewidth',Network(i,j)/m*10)
        hold on
        end
    end
end

end

