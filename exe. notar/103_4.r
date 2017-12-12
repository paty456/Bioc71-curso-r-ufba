e.grandis = read.table('egrandis.csv', sep=';', as.is=F, header=TRUE)
breviarium = summary(e.grandis)
cont.1 = table(e.grandis$ano)
cont.2 = table(e.grandis$rotacao, e.grandis$regiao)
bofete = e.grandis[e.grandis$regiao=='Bofete',]
write.table(bofete,'bofete.txt',sep='\t', row.names=FALSE)