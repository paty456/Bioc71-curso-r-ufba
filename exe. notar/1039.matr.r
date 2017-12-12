#Notar
#103.9 Lembrando matrizes e listas

rnorm(10000, mean = 9.5, sd = 2.2) 
obj1.folhas = rnorm(10000, mean = 9.5, sd = 2.2) 

sample(1:1000, replace=TRUE)
obj1.valores = sample(1:1000, replace=TRUE)


obj2.matriz = matrix(obj1.valores, ncol=10, nrow=100, dimnames=list(paste("individuo",1:100), paste("folha",1:10)))


especies = paste("especies",1:5)
especies = sample(especies,ncol(obj2.matriz),replace=TRUE)
especies = as.factor(especies)

media.individuo = apply(obj2.matriz,1,mean)
media.especie = apply(obj2.matriz,2,mean)
medias = list(porIndividuo=media.individuo, porespecie=media.especie)


obj3.dataframe = data.frame(obj2.matriz, media.especie, stringsAsFactors=TRUE)

objultimo = list(obj1.valores, obj2.matriz, obj3.dataframe,medias)



      

