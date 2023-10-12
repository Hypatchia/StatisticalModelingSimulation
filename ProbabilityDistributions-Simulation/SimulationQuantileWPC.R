
#Simulation of Weibull-Pareto Composite Inverse Function 
rWPC=function(n,theta,beta){
    if (n %% 1 != 0 ){
        stop("n should be an integer")
                    }
    if (n <=1 ){
        stop("n should be superior to 1")
                }
    vec=runif(n)
    x=numeric(n)
    for (i in 1:n){
        x[i] = qWPC(vec[i],theta,beta)
                }
    return(x)

}