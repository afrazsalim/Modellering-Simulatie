function [movieIDs, score] = r0439731_predictedBestMovies(Uk,sk,Vk)
    m = size(Uk, 1);
    n = size(Vk, 1);   
    score = zeros(m, 1);
    for k = 1:m
        movie = Uk(k,:);
        total = 0;
        for g = 1:n
            total = total + (movie*(sk .* Vk(g,:)'));
        end
        score(k) = total/n;
    end
    [score, movieIDs] = sort(score, 'descend');
end
