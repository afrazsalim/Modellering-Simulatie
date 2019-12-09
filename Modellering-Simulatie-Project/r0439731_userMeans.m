function [mu] = r0439731_userMeans(A)
cols = size(A,2);
mu = zeros(cols,1);
for k = 1:cols
   mu(k) = mean(nonzeros(A(:,k))); 
end
end