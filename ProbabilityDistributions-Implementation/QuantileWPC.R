
#Inverse CDF of Weibull-Pareto Function :Quantile
qWPC=function(theta,beta,p){
        if(theta < 0 ){
            stop(" theta should be superior to 0 ")
                    }
        if(beta < 0 ){
            stop(" beta should be superior to 0")
                    }
        if(p < 0 || p > 1){
            stop("p should be between 0 and 1")
                        }

        k=2.857334826
        b=((2*k)+1)/(k+1)
        a=k/(k+1)
        u=k/((2*k)+1)
        if (p<=u ){
            q=theta*((-a *log(1-(b*p)))^(1/(beta*k)))
                }
        else if (p>u){
            q=theta*(b*(1-p))^(-1/beta)
                    }
        return(q)
}