function [movieIDs, score] = r0439731_predictedBestMoviesForUser(R,Uk,sk,Vk,j)
        [row,~] = size(R);
        n = size(Vk, 1);  
        count = 0;
        for i = 1:row
           if(R(i,j) == 0)
               count = count+1;
           end
        end
        disp(count);
        score = zeros(count, 1);
        for i = 1:row
           if(R(i,j) == 0)
               movie = Uk(i,:);
               total = 0;
               total = total + (movie*(sk .* Vk(j,:)'));
               score(i) = total;
           else
               score(i) = -1; %Fill the rest with -1. It will be easy to extract the movies.
           end

        end
       [score, IDs] = sort(score, 'descend');
       disp("Displaying movies");
       for i = 1:10
           disp(score(i))
       end
       score = score(score~=-1);
       rows = size(score,1);
       movieIDs = zeros(rows,1);
       for i = 1 :rows
           movieIDs(i) = IDs(i);
       end       
end