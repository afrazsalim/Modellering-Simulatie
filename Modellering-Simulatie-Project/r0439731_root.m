function [err] =  r0439731_root
   load MovieLens_Subset.mat
   avg = r0439731_userMeans(R);
   [row,col] = find(T);
   result = sparse(row,col,avg(row));
   err = r0439731_RMSE(T,result);
end