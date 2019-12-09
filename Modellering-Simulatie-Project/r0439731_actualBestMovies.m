function [movieIDs, score] = r0439731_actualBestMovies(R)
[score, movieIDs] = sort(r0439731_userMeans(R'), 'descend');
end