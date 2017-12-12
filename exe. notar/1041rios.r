summary("rivers")   

length("rivers")  
rio=rivers<mean(rivers)
rio
a= which(rio==TRUE) 
prop.mm= length(a)/length(rivers) 
summary(rivers)
quantile(rivers, .75)
quantil.75 =quantile(rivers,.75)

medias = mean(rivers) 

mediana = median(rivers)
m.trun = mean(rivers, trim=.25)  

medias = c(medias, mediana, m.trun)



