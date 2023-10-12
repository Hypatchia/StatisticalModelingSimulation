
#Weibull-Pareto Composite Probability Density Function
dWPC=function(theta,beta,x){
        if(theta < 0 ){
            stop(" theta should be superior to 0")
                    }
        if(beta < 0 ){
            stop(" beta should be superior to 0")
                    }
        n=length(x)
        for (i in 1:n){
            if(x[i] < 0){
                stop("x should be superior to 0")
                        }
                    }
        k=2.857334826
        a=(k+1)^2/(2*k+1)
        b=(k+1)/k
        c=(k+1)/(2*k+1)
        f=numeric(n)
        for(i in 1:n){
            if (x[i]<=theta ){
                f[i]=(beta*a/x[i])*((x[i]/theta)^(beta*k))*(1-exp(-b*(x[i]/theta)^(beta*k)))
                            }
            else if (x[i]>theta){
                f[i]=c*(beta/x[i])*(theta/x[i])^beta
                                }
                    }
        return(f)
}