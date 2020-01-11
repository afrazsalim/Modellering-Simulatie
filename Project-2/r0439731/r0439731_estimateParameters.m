function [mu,sigma] = r0439731_estimateParameters(s)
   firstVector = s(1:length(s)-1);
   secondVector = s(2:length(s));
   result = log(secondVector ./firstVector);
   sigma = std(result);
   mu = mean(result) + 0.5*(sigma^2);
end