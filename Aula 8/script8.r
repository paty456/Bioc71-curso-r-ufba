####script 8
#7a. Regressao Linear Simples
#Ajuste e diagnostico de uma regressao

library(MASS)
data(Animals)
str(Animals)

plot(brain~body, data=Animals)  #plot de y cerebro e x corpo dos dados dos animais
