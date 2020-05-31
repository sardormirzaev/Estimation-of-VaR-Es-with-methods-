clear;

//load function
funcprot(0);
exec ("./RiskMan_2017-18_WS_QF_VaR_ES_var_covar.sci");

// trading days
td = 252;

// level Value at Risk
alpha = 0.98;

// load DAX time series
ts_dax = csvRead('./time_series_dax.csv', '\t',',');

// extract data
s = ts_dax(:,1);


// compute log returns
x = [0; log(s(2:$)./s(1:$-1))];


VaR_var_covar = zeros(length(s));
ES_var_covar = zeros(length(s));

for m=(td+1):(length(s)-1)
    
     // compute parameters for linearized loss and VaR, ES for the next day
    c = 0;
    w = s(m);
    [VaR_var_covar(m+1), ES_var_covar(m+1)] = VaR_ES_var_covar (x(m-td+1:m), c, w, alpha);
    
end

// plots
scf(0); clf(0);



// plot value at risk and expected shortfall
loss=[0; -diff(s)];
plot(loss(td+2:$));
plot (VaR_var_covar(td+2:$),'g');
plot (ES_var_covar(td+2:$), 'r');

title ('Variance-Covariance Method');
xlabel('trading day');
legend("loss","Value at Risk"," Expected Shortfall");






   
   
  





