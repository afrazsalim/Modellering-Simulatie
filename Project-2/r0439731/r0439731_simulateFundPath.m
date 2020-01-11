function [path] = r0439731_simulateFundPath(initialPrice,mu,sigma,months)
          path = zeros(months,1);
          path(1) = initialPrice ;
          t = 1;
          for i = 2:months
              path(i) = path(i-1) * exp((mu-0.5*(sigma^2))*t + sigma*sqrt(t)*randn);
         end
end

