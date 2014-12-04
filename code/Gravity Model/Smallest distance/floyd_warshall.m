function [ F ] = floyd_warshall(Network)
%FLOYD_WARSHALL implement Floy-Warshall-algorithm
%   I looked up in my lectures note from brevious semester and found an
%   algorithm which does excatlly what we wont

n=size(Network);

for l=1:n+1
    F{l}=zeros(n);
end

F{1}=Network;

for k=2:n+1
    for i=1:n
        for j=1:n
            F{k}(i,j)=min(F{k-1}(i,j),F{k-1}(i,k-1)+F{k-1}(k-1,j));
        end 
    end
end

F=F{n+1};

