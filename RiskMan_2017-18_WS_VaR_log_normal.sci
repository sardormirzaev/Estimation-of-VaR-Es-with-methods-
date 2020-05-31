function v = VaR_log_normal (s, alpha)
    
    // compute log returns, empirical mean and standard deviation
    x = log(s(2:$) ./ s(1:$-1) );
    mu = mean(x);
    sigma = sqrt(variance(x));
    
    // compute alpha-quantile of N(0,1)
    q = cdfnor("X", 0, 1, alpha, 1-alpha);
    
    // compute VaR
    v =  s($) * ( 1 - exp(-sigma*q + mu) );
endfunction
