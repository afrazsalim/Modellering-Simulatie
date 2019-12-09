function [U,s,V,rmse] = r0439731_rank1MatrixPursuit(R,k,T)
[m, n] = size(R);
rmse = zeros(k,1);
U = zeros(m,k);
V = zeros(n,k);
U(:,1) = ones(m,1);
V(:,1) = r0439731_userMeans(R);
S = r0439731_sparseModel(U(:,1),1,V(:,1),R);
P = r0439731_sparseModel(U(:,1),1,V(:,1),T);
E = R - S;
rmse(1) = r0439731_RMSE(T,P);
for j = 2 : k
[u,~,v] = svds(E,1);
U(:,j) = u;
V(:,j) = v;
s = r0439731_optimalCoefficients(U(:,1:j),V(:,1:j),R);
S = r0439731_sparseModel(U(:,1:j),s,V(:,1:j),R);
P = r0439731_sparseModel(U(:,1:j),s,V(:,1:j),T);
E = R - S;
rmse(j) = r0439731_RMSE(T,P);
end
end
