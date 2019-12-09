function [X] = r0439731_sparseModel(Uk, Sk, Vk, A)
    if size(Uk,2) ~= size(Vk,2) || size(Sk,1) ~= size(Vk,2) %% Because for V, we take the transpose.
         throw(MException("Size of the matrices is not equal"));
    end
    [row, col, val] = find(A); 
    for index = 1:length(row)
          val(index) = Uk(row(index), :) .* Sk' * Vk(col(index), :)'; %%For diagonal matrix, we can use elements-wise operations.
    end
    X = sparse(row, col, val); 
end