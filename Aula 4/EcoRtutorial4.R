aves.c <- read.table("aves_cerrado.csv", row.names=1, header=T, sep=";", dec=",", as.is=T)
aves.c <- read.csv2("aves_cerrado.csv", row.names=1, as.is=T)

head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c)

?str() #Exibe rapidamente a estrutura interna de um objeto R, uma funcao de diagnostica e uma alternativa ao resumo.
aves.c[aves.c$urubu==NA,] #indexa todas as linhas antes da vírgula
is.na(aves.c) # retorna um vetor logico que usamos para indexar o data frame ou um de seus vetores / indica os NA como true
is.na(aves.c$urubu) #retorna todos os vetor aves.c indexado a coluna urubu com os valores NA, como true
aves.c[is.na(aves.c$urubu),] # retorna a linha no qual apresenta NA na coluna urubu / , ] indica todas as linhas 
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] 
temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]
aves.c$urubu[is.na(aves.c$urubu)] <- 0 #corrigir estes valores, adicionando  0 no lugar de NA
aves.c[is.na(aves.c$carcara),3] <- 0 # o tres e a coluna, antes da virfula e linha
aves.c[is.na(aves.c[,4]), 4] <- 0  
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,] #verificacao das alteracoes de NA para 0
temp1 #listagem antiga a alteracao de NA = 0
table(aves.c$fisionomia) #verificar os valores da coluna, logo CC 20, ce 1, Ce 19, CL 20
aves.c$fisionomia[aves.c$fisionomia=="ce"] <- "Ce" 
table(aves.c$fisionomia) #verificar valores da coluna
aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))
str(aves.c)
summary(aves.c)
