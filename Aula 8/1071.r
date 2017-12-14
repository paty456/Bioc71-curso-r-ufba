#sript 107.1

Altura.2anos = c(39,30,32,34,35,36,36,30)
Altura.adulto = c(71,63,63,67,68,68,70,64)

alturas = data.frame(Altura.2anos, Altura.adulto)

plot(alturas$Altura.adulto~alturas$Altura.2anos)
alturas.lm = lm(alturas$Altura.adulto~alturas$Altura.2anos)
abline(alturas.lm, col="red")

alturas.conf = confint(alturas.lm)

crenca = 2*alturas$Altura.2anos
plot(crenca~alturas$Altura.2anos)
crenca.lm = lm(crenca~alturas$Altura.2anos)
abline(crenca.lm, col="blue")
