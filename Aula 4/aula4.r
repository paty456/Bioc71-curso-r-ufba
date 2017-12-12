#### aula grafico - 4
#plotar sempre no objeto, primeiro cria um objeto para isso
plot(x= iris$Sepal.Length, y=iris$Petal.Length,col=c(2,19,32))  #col: cor do que sera plotado a partir da coluna especie/ objeto iris/ coluna sepala 
#plotar en outra janela x11()
#tres eixos, x, y e col(pode ser numero) --> col=c(7,2,18)) ou cor por nome col=c("red", "black"))  , rainbow divide em tres pontos, restribuindo os pontos
colors()
plot(iris$Sepal.Length ~ iris$Petal.Length,col=rainbow(3), col.axis = "red",xlab="eixo x", ylab = "eixo y") # til ~ eixo y em funcao de x  /xlab e ylab = coloca o noem dos eixos
help("plot")
#col.axis muda cor dos eixos
legend(3.4,8, legend = c(unique(iris$Sepal.Width)))
text(6.6,7,"teste") #nome de legenda

#grafico de linha --> linha (type)
plot(iris$Sepal.Length ~ iris$Petal.Length
     # ,type="l" #defini para tipo linha, 
     ,col=rainbow(3)
     ,col.axis = "red"
     ,xlab="eixo x"
     ,ylab = "eixo y"
     ,main ="bolinhas"
     , family="serif"    #muda a fonte dos titulos
     ,cex =2 #muda o tamanho das bolinhas, 0. estah omitido
     #,lwd = 14 #altera a espessura da linha
     #,lty = "dotdash"  #altera o tipo da linha, podendo ser tracejado ou n
    , xlim =c(1, 5) # xlim=range(iris$sepal.lenght) o RANGE pega amplitude dos limites colocados de 1 a 5, como limite de corte
    , ylim =c(5, 8)
    ,las=1 #deixa os valores dos eixos horizontal, vertical..las =1 todos em pé, las=3 ficam todos deitados
    ,bty="n"
    )

# main ="titulo do grafico
#xlim e ylim (limite das linhas no eixo x e y) / xlim =c(1, 5)
#bty altera o formato de linhas em volta do grafico, podndo ser 0, l, 7 

### enfeitando grafico
#Função par() altera area de plotagem 
#e função axis()

par(mfrow=c(2,3), cex=.8) #uma linha e 2 colunas
plot(x=iris$Sepal.Length, y=iris$Petal.Length,        #primeiro gráfico
     col = iris$Species,                          
     main = "Sepal.Length x Petal.Length")     

plot(x=iris$Sepal.Length, y=iris$Sepal.Width,         #segundo gráfico
     col = iris$Species,                          
     main = "Sepal.Length x Sepal.Width in Iris")      

plot(x=iris$Petal.Width, y=iris$Sepal.Width,         #terceiro gráfico
     col = iris$Species,                          
     main = "Petal.Width x Sepal.Width in Iris")  
dev.off()

abline(h=mean(iris$Petal.Width), col ="blue"
       ) #horizontal reta
abline(h=mean(iris$Sepal.Length), col ="red"
) #vertical reta
plot(iris$Sepal.Length)

abline(v=mean(iris$Sepal.Width), col= "pink")
plot(iris$Sepal.Width)

abline(a=3, b=0.2, col="green") #a intercepto, b =inclinacao
mod=lm(iris$Petal.Length ~ iris$Sepal.Length) #regressao linear
abline(mod)#reta de regressao
dev.off() #desliga o dispositivo e reseta o par ()
points(x=2, y=2) #ponto das coordenadas x e y  / limite de pontos
arrows(x0, y0=2, x1=1, y1=1, angle = 90) #seta indo de x0 e y0 para x1, y1 adiciona uma seta a um gráfico. length é o comprimento da seta e angle é o angulo da ponta da seta
segments()# adiciona um segmento indo de (x0,y0) até (x1,y1)


m1=mean(dragoes$y[dragoes$x=="aventureiros"]);m2=mean(dragoes$y[dragoes$x=="fazendeiros"])
m3=mean(dragoes$y[dragoes$x=="vacas"]);m4=mean(dragoes$y[dragoes$x=="virgens"],na.rm = T)
s1=sd(dragoes$y[dragoes$x=="aventureiros"]);s2=sd(dragoes$y[dragoes$x=="fazendeiros"])
s3=sd(dragoes$y[dragoes$x=="vacas"]);s4=sd(dragoes$y[dragoes$x=="virgens"],na.rm = T)
avg=c(m1,m2,m3,m4)
sdev=c(s1,s2,s3,s4)
plot(x= 1:4, y= avg,cex=1.5,pch=16, col=1:4,ylim=range(c(avg-sdev, avg+sdev)))
arrows(x0=1:4, y0=avg-sdev, x1=1:4, y1=avg+sdev, length=0.05, angle=90, code=3) #(x0=1:4, y0=avg-sdev, x1=1:4, y1=avg+sdev de um até quatro, mesclando de um fator para outro
abline(h=mean(avg), col="red")#media total

class(1)
vacas = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998, 125.49993, 
          111.07215, 113.74047, 103.16081, 80.87149, 98.66692, 65.09549, 155.74965, 
          88.30168, 147.4361, 114.60806, 109.87433, 149.54772, 83.54137)
fazendeiros = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058, 
                79.98952, 79.18127, 840.1635, 74.8686, 82.01886, 78.26936, 77.94691, 78.75372, 
                77.64901, 77.64097, 77.19803, 72.48175, 83.45336, 78.99681)
virgens = c(127.9366, 201.7158, 136.1366, 136.588, 131.7213, 118.1486, 125.7534, 
            139.6544, 163.589, 139.7455, NA, 141.445, 110.7311, 157.5921, 176.8437, 
            102.8659, 121.8286, 134.7097, 157.1392, 166.7133)
aventureiros = c(191.3721, 216.1671, 165.438, 196.273, 172.6565, 178.2955, 193.6687, 
                 189.7674, 160.2968, 208.44, 204.0934, 208.1798, 186.638, 193.9446, 197.365, 
                 198.6853, 213.8838, 210.1881, 209.9109, 210.9228)
alimento = c(rep("vacas", 20), rep("fazendeiros", 20), rep("virgens", 20), rep("aventureiros", 
                                                                               20))
dragoes = data.frame(x = alimento, y = c(vacas, fazendeiros, virgens, aventureiros))
head(dragoes)
summary(dragoes) #funcao resumo dos testes estatisticos
plot(dragoes)
x11(dragoes)
plot(dragoes)
x11()

boxplot(dragoes$y ~ dragoes$x, col=rainbow(length(dragoes$x))) #eixo x um fator







