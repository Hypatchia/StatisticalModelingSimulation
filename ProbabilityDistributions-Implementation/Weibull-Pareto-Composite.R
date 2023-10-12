

#Weibull-Pareto Composite Cumulative Distribution Function
pWPC=function(theta,beta,x){
    if(theta < 0 ){
        stop("theta should be superior to 0")
                }
    if(beta < 0 ){
        stop("beta should be superior to 0")
                }
    n=length(x)
    for (i in 1:n){
        if(x[i] < 0){
            stop("x should be superior to 0 ")
                    }
                }


    k=2.857334826
    a=(k+1)/(2*k+1)
    b=(k+1)/k
    F=numeric(n)
    for(i in 1:n){
        if (x[i]<=theta ){
            F[i]=a*(1-exp( b*(x[i]/theta)^(beta*k)))
                        }
        else if (x[i]>theta){
            F[i]=1-a*(theta/x[i]^beta)
                            }
                }
    return(F)
}