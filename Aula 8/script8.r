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
Animals[log(Animals$body) > 8 & log(Animals$brain) < 6, ] #Dipliodocus   11700  50.0
#Triceratops    9400  70.0
#Brachiosaurus 87000 154.5
# animal e corpo em log acima dos valores de 8 e animal e cerebro < que 6

anim.m1 <- lm(log(brain)~log(body),data=Animals) #regressao lm e nomeando para o objeto anim.m1
abline(anim.m1, col="blue") #linha de regressao

plot(anim.m1)
#qqnormal a linha reta e os pontos estão proximos a linha menos os tres dinossauros
x11() #os dinossauros sao outline 
anim.m2 <- lm(log(brain)~log(body),data=Animals, 
              subset=!(log(Animals$body)>8&log(Animals$brain)<6)) #ajustando a regressao menos os dinossauros, com o subset que retira os > que 8 em relacao ao corpo e < que seis em relacao ao cerebro, sendo criado como anim.m2

plot(log(brain)~log(body), data=Animals) #plotando sem os dinossauros 
abline(anim.m1, col="blue", lty=2) #com a linha azul a reta das medias dos dinossauros grande e cerebro pequenos
abline(anim.m2, col="red")#reta vermelha, com os valores de medias reajustados, sem os outlines

# Novos Diagnósticos (4 gráficos de uma vez) mostram que agora ainda temos alguns problemas (quais?): 

par(mfrow=c(2,2)) #plotando graficos 2x2
plot(anim.m2)
par(mfrow=c(1,1))
#apos a retirada dos dinossauros surgiram novos outlines os humanos, rhesus monkey e chimpanzee

anova(anim.m2) #calcula da analise das tabelas de variancia ou desvio para um ou mais objetos dos modelos ajustados. A tabela de anova mostrou que corpo tem valor de p significativo para cerebro
summary(anim.m2) #sumariza os dados com a regressao linear, mostrando que corpo eh significativo para cerebro
coef(anim.m2) # intercepto (a) 2.1504121 e (b) log(body) 0.7522607 coeficientes estimados
confint(anim.m2) #intervalos de confianca que eh um intervalo estimado de um parametro de interesse de uma populacao. Em vez de estimar o parametro por um unico valor, eh intervalo de estimativas provaveis.
##2.5 %    97.5 %
  #(Intercept) 1.7354320 2.5653922
#log(body)   0.6576845 0.8468369

#Exercícios 7 - Regressões Lineares Simples
#7.1 Altura na Infância e Na Vida Adulta  (Notar)

#7.2 O modelo mais simples possível

anim.m2 <- lm(log(brain)~log(body),data=Animals, 
              subset=!(log(Animals$body)>8&log(Animals$brain)<6))
anim.m0 <- lm(log(brain)~1, data=Animals, 
              subset=!(log(Animals$body)>8&log(Animals$brain)<6)) #comparando cerebro a um e sem as informacoes do corpo, ou seja sem uma variavel preditora, sempre sendo 1

anova(anim.m0,anim.m2) #comparando os valores de log corpo e cerebro (m2) e log cerebro e sem corpo, aproximando a 1 dos dois modelos

anova(anim.m2)#mostrando os valores da regressao linear de anim.m2 somente

summary(anim.m0) #sumario da regressao linear contendo media do intercepto e os valores do erro , ou seja, os residuos 
mean(log(Animals$brain[!(log(Animals$body)>8&log(Animals$brain)<6)])) #media dos valores de log cerebro e corpo maiores que 8 e log de cerebro menores que 6 
sd(log(Animals$brain[!(log(Animals$body)>8&log(Animals$brain)<6)])) # o valor de desvio padrao mostra os mesmos valores residuais mostrado no summary, evidenciando os residuos padrao em relacao e media(reta)


