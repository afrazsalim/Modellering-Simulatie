function [yields, invested] = r0439731_simulateFundInvesting(budget, priceHistory, alpha, N)
        [mu,sigma] = r0439731_estimateParameters(priceHistory);
          [rows,cols] = size(alpha);
          yields = zeros(1,N);
           first = priceHistory(end,1);
           second = priceHistory(end,2);
          for i = 1 :N
              pricePathA = r0439731_simulateFundPath(first,mu,sigma,rows);
              pricePathB = r0439731_simulateFundPath(second,mu,sigma,rows);
             [yield, invested, ~, ~] = r0439731_simulateFundInvestingPath(budget, [pricePathA pricePathB], alpha);
             yields(i) = yield;
         end


end