function [sum] = test_recursion(n)

sum=0;
if(n>0)
sum=test_recursion(n-1)+2;
end

end

