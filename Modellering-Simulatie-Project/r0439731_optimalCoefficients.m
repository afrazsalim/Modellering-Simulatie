function [s] = r0439731_optimalCoefficients(Uk,Vk,A)
 [rowU,colU] = size(Uk);
 [rowV,unUsed] = size(Vk);
 non_zero_elem = nnz(A);
 rows = rowU*rowV;
 non_zero = non_zero_elem*colU;
 B  = spalloc(rows,colU,non_zero);
 for i = 1:colU
     %%Separate the columns of U and V. Let Sk be 1.
     result = r0439731_sparseModel(Uk(:, i), 1, Vk(:, i), A);
     B(:,i) = result(:);
 end
 s = lsqr(B, A(:));
end