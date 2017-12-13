####script 8
#7a. Regressao Linear Simples
#Ajuste e diagnostico de uma regressao

library(MASS) #pacote de dados de massa
data(Animals) #dados sobre o objeto animals
str(Animals) ##avalia a estrutura do objeto

plot(brain~body, data=Animals)  #plot de y cerebro e x corpo dos dados dos animais
#N foi linear
plot(brain~body,data=Animals, log="xy") #transforma os dados em seus logaritmos, dentro da função plot
plot(log(brain)~log(body), data=Animals) #nomea o y em log brain e x em log body plotando os valores transformados em log
