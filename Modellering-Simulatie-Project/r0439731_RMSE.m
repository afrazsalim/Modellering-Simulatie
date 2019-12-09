function [err] = r0439731_RMSE(A,B)
 D = find(A);
 N = length(D);
 Div = 1 / sqrt(N);
 err = Div* norm(A - B, 'fro');
end