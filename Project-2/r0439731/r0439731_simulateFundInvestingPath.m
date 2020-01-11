function [yield, invested, value, units] = r0439731_simulateFundInvestingPath(budget, pricePath, alpha)
    [rows,cols] = size(pricePath);
    units = zeros(rows,cols);
    budget_per_month = budget;
    current_budget = budget_per_month;
    percentage_increment = 0.02;
    tax = 1.0035;
    invested = current_budget;
    transaction_costs = 6;
    if((((current_budget*alpha(1) -transaction_costs)/tax) >= 0))
        units(1,1) = (((current_budget*alpha(1) -transaction_costs)/tax)/pricePath(1,1));
    elseif (((current_budget - transaction_costs)/tax) > 0)
        units(1,2) = (((current_budget - transaction_costs)/tax)/pricePath(1,2));
    end
    for i = 2:rows
        if(((current_budget*alpha(i) -transaction_costs)/tax) >= 0) && (((current_budget*(1-alpha(i)) -transaction_costs)/tax) >= 0)
            units(i,1) = (((current_budget*alpha(i) -transaction_costs)/tax)/pricePath(i,1));
            units(i,2) = (((current_budget*(1-alpha(i)) - transaction_costs)/tax)/pricePath(i,2));         
      elseif(((current_budget*alpha(i) -transaction_costs)/tax) < 0) && (((current_budget*(1-alpha(i)) -transaction_costs)/tax) >= 0)
                units(i,2) = (((current_budget - transaction_costs)/tax))/pricePath(i,2);
     elseif(((current_budget*alpha(i) -transaction_costs)/tax) >= 0) && (((current_budget*(1-alpha(i)) -transaction_costs)/tax) < 0)
                 units(i,1) = (((current_budget -transaction_costs)/tax))/pricePath(i,1);
        else
         %     units(i,1) = units(i-1,1);
         %     units(i,2) = units(i-1,2);          
        end
        if(mod(i,12) == 0)
            budget_per_month = budget_per_month + (budget_per_month*percentage_increment);
        end   
        current_budget = budget_per_month;
        invested = invested  + budget_per_month;
    end
    first = cumsum(units(:,1));
    second = cumsum(units(:,2));
    P = [first,second];
    units = [first,second];
    value = pricePath .*  P;
       
    total = sum(value(end,:));
    yield = (total-invested)/invested - 1;
end