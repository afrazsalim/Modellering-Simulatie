function [yield,invested,value] = r0439731_simulateSavingInvesting(budget,rate,months)
   value = zeros(1,months);
   interests_per_month = zeros(1,12);
   rate_increment = 0.02;
   current_budget=budget;
   budget_per_month = current_budget;
   current_month = 1;
   index = 1;
   previous_debt = 0;
   invested = current_budget;
   interests_on_previous_debt = 0;
   for i = 1:months
       value(1,i) = budget_per_month;
        if(mod(i,13) == 0)
            if(i-13 > 0)
                previous_debt = previous_debt + value(1,(i-12));
                interests_on_previous_debt = (previous_debt*(rate/100));
            end
            previous_debt = interests_on_previous_debt +sum(interests_per_month);
            value(1,i) = value(1,i) + interests_on_previous_debt;
            budget_per_month = budget_per_month + previous_debt;
            interests_per_month = zeros(1,12);
            current_month = 1;
            index = 1;
        end
        if(mod(i,12) == 0)
            current_budget = current_budget+(rate_increment*current_budget);
        end
        interests_per_month(1,index) = (((13-current_month)/12)*(rate/100))*current_budget;
        budget_per_month = current_budget + budget_per_month;
        invested = invested + current_budget;
        current_month = current_month +1;
        index = index+1;
   end
   yield = (cumsum(value(end))-invested)/invested;
   disp("Total profit is "+ yield);
end