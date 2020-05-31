function [VaR, ES] = VaR_ES_var_covar (x_data, c, w, alpha)
    mu = mean(x_data);
    sigma = sqrt(variance(x_data));
    z_alpha = cdfnor("X", 0, 1, alpha, 1-alpha);
    
    VaR = -(c + w*mu) + w*sigma*z_alpha;
    ES = -(c + w*mu) + w*sigma/(1-alpha)*distfun_normpdf(z_alpha, 0, 1);
endfunction
