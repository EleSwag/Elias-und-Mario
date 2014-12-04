function  plot_connection(Network,Coordinates,scalingfactor)
% Pre: Coordiantes are the x-y-Coordinates of the the nodes 
%      Network is an adjacency matrix of a network and the funktion plots 
%      the connection in a coordinate system.
%      Scaling factor is a factor to adjust the thick of a line, all lines
%      are drown in relation to that

% Post: A Ploting of the network in a figure

% Note that the matrix should be symmetric e.g. from a undirected network



m = scalingfactor;

n=size(Network,1);

for i=1:n
    for j=i:n
        if Network(i,j)~=0
            % all lines are green(deepth shows strongness) but to
            % illustrate it even better the lines also have diffrent
            % thickness related to the scaling factor
            plot([Coordinates(i,1) Coordinates(j,1)],[Coordinates(i,2) Coordinates(j,2)],'Color',[0 1-Network(i,j)/m 0],'Linewidth',Network(i,j)/m*10)
            hold on
        end
    end
end

end

