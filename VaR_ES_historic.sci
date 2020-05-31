function [VaR, ES] = VaR_ES_historic (x_data, l, alpha)
    l_data_sorted = gsort (l(x_data), "g", "d");
    n = length(l_data_sorted);
    VaR = l_data_sorted( floor(n*(1-alpha)) +1 );
    ES = 1 / (floor(n*(1-alpha)) +1) * sum(l_data_sorted(1:floor(n*(1-alpha)) +1));
endfunction
