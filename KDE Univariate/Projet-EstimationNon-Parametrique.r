## Full tasks required by the project 
# Loi Discrete
# 1 Generation des Echantillions de tailles N1,N2,N3,N4
N1 = 50
N2 = 100
N3 = 500
N4 = 1000

# Parametres de la loi Binomial(5,0.4)
a = 5
p= 0.4

# rbinom est une fonction qui genere des observations de loi binomiale 
# Elle prend comme parametres
# N1 : La taile desirée
# a et p les parametres de la loi .
X1 <-rbinom(N1,a, p)
X2 <-rbinom(N2,a, p)
X3 <-rbinom(N3,a, p)
X4 <-rbinom(N4,a, p)

# Visualization de la focntion de densité empirique des 4 Echantillions
plot(ecdf(X1))
plot(ecdf(X2))
plot(ecdf(X3))
plot(ecdf(X4))

# Les histogrammes des 4 Echantillions 
hist1<- hist(X1)
hist2<- hist(X2)
hist3<- hist(X3)
hist3<- hist(X4)

?ecdf
# Plot dans le meme graphe :

# X1
hist1<- hist(X4)
plot(ecdf(X4),add=TRUE,col=c('red'),main ="ecdf x1")
# X2
hist2<- hist(X2)
plot(ecdf(X2),add=TRUE,col=c('green'),sub="ecdf x2")
# X3
hist3<- hist(X3)
plot(ecdf(X3),add=TRUE,col=c('yellow'))
# X4
hist4<- hist(X4)
plot(ecdf(X4),add=TRUE,col=c('pink'))


# Loi Absolument Continue
# Generation de loi Normal centrée reduite 
Y1 <- rnorm(N1)
Y2 <- rnorm(N2)
Y3 <- rnorm(N3)
Y4 <- rnorm(N4)

#Histogrammes :
histn1 <-hist(Y1)
histn2 <-hist(Y2)
histn3 <-hist(Y3)
histn4 <-hist(Y4)

# les densités 
plot(density(x = Y1))
plot(density(x = Y2))

plot(density(x = Y3))
plot(density(x = Y1))

# Select a particular bandwidth (0.5) and kernel (Epanechnikov)
lines(density(x = Y1, bw = 0.5, kernel = "epanechnikov"), col = 2)
lines(density(x = Y1, bw = 0.5, kernel = "gaussian"), col = 3)
lines(density(x = Y1, bw = 0.5, kernel = "rectangular"), col = 4)
lines(density(x = Y1, bw = 0.5, kernel = "cosine"), col = 5)


plot(density(x = Y2))
# Select a particular bandwidth (0.5) and kernel (Epanechnikov)
lines(density(x = Y2, bw = 0.9, kernel = "epanechnikov"), col = 2)
lines(density(x = Y2, bw = 0.57, kernel = "gaussian"), col = 3)
lines(density(x = Y2, bw = 0.3, kernel = "rectangular"), col = 4)
lines(density(x = Y2, bw = 0.1, kernel = "cosine"), col = 5)


# ECDFs 
plot(ecdf(Y1))
plot(ecdf(Y2))
plot(ecdf(Y3))
plot(ecdf(Y4))
