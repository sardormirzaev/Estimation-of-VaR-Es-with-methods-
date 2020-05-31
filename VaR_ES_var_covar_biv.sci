function [VaR, ES] = VaR_ES_var_covar_biv (x_data, c, w, alpha)
    mu = mean(x_data, 'r')';
    Sigma = cov(x_data);
    z_alpha = cdfnor("X", 0, 1, alpha, 1-alpha);
    
    VaR = -(c + w'*mu) + sqrt(w'*Sigma*w)*z_alpha;
    ES = -(c + w'*mu) + sqrt(w'*Sigma*w)/(1-alpha)*distfun_normpdf(z_alpha, 0, 1);
endfunction
