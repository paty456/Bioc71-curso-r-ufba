#### aula 4 
####PATRICIA MOTA

getwd()
setwd()

### exercicio 1

esaligna = read.csv("C:/Users/paty/Documents/R/esaligna.csv") 


#passo a passo de colocacao de objeto
#dap e ht  #dap di√¢metro a altura do peito (1,3 m altura do tronco) e ht  = altura da √°rvore

plot(esaligna)
boxplot(esaligna)
barplot(esaligna)


plot(esaligna$dap ~ esaligna$ht,col=rainbow(3)) #plot de esaligna de dap como eixo y e ht como eixo x com formato de bolinhas nos pontos
boxplot(esaligna$dap ~ esaligna$ht,col=rainbow(3)) #boxplot de esaligna de dap como eixo y e ht como eixo x com formato de caixinhas nos pontos

barplot(esaligna$dap ~ esaligna$ht,col=rainbow(3)) #height' deve ser um vetor ou uma matriz , pois o barploT soh aceita uma variavel

#ht e tronco (biomassa do tronco)

plot(esaligna$ht ~ esaligna$tronco,col=rainbow(3)) #plot de esaligna de ht como eixo y e tronco como eixo x com formato de bolinhas nos pontos 
boxplot(esaligna$ht ~ esaligna$tronco,col=rainbow(3)) #boxplot de esaligna de ht como eixo y e tronco como eixo x com formato de caixinhas nos pontos
barplot(esaligna$ht ~ esaligna$tronco,col=rainbow(3)) #height' deve ser um vetor ou uma matriz , pois o barploT soh aceita uma variavel

#dap e classe
plot(esaligna$dap ~ esaligna$classe,col=rainbow(3)) #plot de esaligna de dap como eixo y e classe como eixo x com formato de boxplot por causa da categoria de classe

boxplot(esaligna$dap ~ esaligna$classe,col=rainbow(3)) #boxplot de esaligna de dap como eixo y e classe como eixo x com formato de boxplot por causa da categoria de classe

barplot(esaligna$dap ~ esaligna$classe,col=rainbow(3))#height' deve ser um vetor ou uma matriz , pois o barploT soh aceita uma variavel

#dap e talhao
plot(esaligna$dap ~ esaligna$talhao,col=rainbow(3))#plot de esaligna de dap como eixo y e talhao como eixo x com formato de bolinhas nos ponto

boxplot(esaligna$dap ~ esaligna$talhao,col=rainbow(3))
#plot de esaligna de dap como eixo y e talhao como eixo x com formato de boxplots 

barplot(esaligna$dap ~ esaligna$talhao,col=rainbow(3))#height' deve ser um vetor ou uma matriz , pois o barploT soh aceita uma variavel

#dap

plot(esaligna$dap)#eixo y com dap e eixo x nomeado como indice
boxplot(esaligna$dap)#boxplot somente com os valores de dap de esaligna no eixo y
barplot(esaligna$dap)#barplot gerado com os valores de dap de esaligna no eixo y com formato de histograma

#ht
plot(esaligna$ht)#eixo y com altura e eixo x nomeado como indice
boxplot(esaligna$ht)#boxplot somente com os valores de altura de esaligna no eixo y
barplot(esaligna$ht)#barplot gerado com os valores de altura de esaligna no eixo y com formato de histograma

####exercicio 2

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
#O nome do eixo x para ‚ÄúTamanho da Ilha (ha)‚Äù
plot(riqueza ~ area
     , xlab="tamanho da ilha(ha)" #nome do eixo x para tamanho da ilha(ha)
     ,ylab="Riqueza de Especies" # O nome do eixo y para ‚ÄúRiqueza de Esp√©cies‚Äù 
     ,main ="Aves das Ilhas Samoa" #nome do titulo 
     ,pch = 15 #altera o formato do tipo dos pontos 
     , family="serif"   #alteracao da fonte dos eixos para times new roman
     ,cex.sub =2 #altera tamanho dos pontos e legenda
     ,las=3
     )#tudo horizontal a direcao das escalas
     
dev.off()
#O tipo de ponto (numero de 0 a 25) 
#O tamanho dos pontos e legendas 
# A dire√ß√£o da escala do gr√°fico (para ficar tudo na horizontal) 
#O tipo de fonte das legendas (para ficar tudo como em Times New Roman ‚Äì dica= ‚Äúserif‚Äù) 


###exercicio 3

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
area.cate <- rep(c("pequeno", "grande"), each=6)

plot(riqueza~area)

plot(riqueza~area, bty="l", tcl=0.3) #retirou as linhas superior e lateral direita do grafico, com os eixos y riqueza e x area

boxplot(riqueza~area.cate, bty="l", tcl=0.3) #boxplot de riqueza no eixo y, mas os valores de x ficaram reorganizados em grandes e pequenos

par(bty="l") # tipo de caixa de grafico
par(tcl=0.3) #comprimento dos ticks (em relacao ao texto) 
boxplot(riqueza~area.cate) #retirou as ,linhas superior e lateral direita

### exercicio 4

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
abundancia <- rev(riqueza)

plot(riqueza~area)
lines(lowess(area, riqueza)) #colocacao de linhas

model <-  lm(riqueza~area) #regressao linear
plot(riqueza~area) #plotagem da regressao
abline(model) #insercao de linha reta com intercepto e inclinacao definidos
abline(a=12, b=0.8, col="red") #a intercepto, b =inclinacao, col=cor da linha
abline(v=mean(riqueza), col="blue") #linhas verticais tracando na media de riqueza, col=cor da linha
abline(h=mean(area), col ="orange")#linhas horizontais tracando na media de area,col=cor da linha
text(14,40,"pontos") #inserido no eixo x referente a 14 e eixo y referente a 40 a palavra pontos

mtext("retangulo", side=2, line=0.4, at=2,cex=2, family="serif") #insercao da legenda na lateral esquerda do grafico, alinhamento, tamanho de fonte e tipo de fonte
#par(new=TRUE) #criacao de um novo grafico sobre o anterior, sobrepondo
#plot(abundancia~area)
par(new=TRUE)
plot(abundancia~area, axes=FALSE, ann=FALSE, pch=16) 
axis(4)#adiciona valores do eixo y na lateral direita

plot(riqueza~area)
rect(20,20,40,40) #inserindo retangulo nos valores x e y =20 e x e y =40
jpeg(filename = "area.jpg") #salvamento em jpg


### exercicio 5 criacao de graficos

#5.1 Editando alguns par√¢metros gr√°ficos

#Crie um gr√°fico de dispers√£o entre dap ht) com:
#Legendas dos eixos com nomes das vari√°veis e suas unidades

esaligna = read.csv("C:/Users/paty/Documents/R/esaligna.csv") 
plot(esaligna$dap ~ esaligna$ht,col="green"
, xlab="altura(m)"
, ylab="diametro(cm)"
, tlc=0.3   #marcacoes do eixos (ticks) para dentro da area do grafico 
, bty ="l"   #Apenas dois eixos (formato "L")
, main= "diametro por alt"   #TÌtulo informativo
) 
par(cex=0.8)  #Tamanho das fontes maiores que o padrao
plot(esaligna$dap ~ esaligna$ht,col="green"
     , xlab="altura(m)"
     , ylab="diametro(cm)"
     , tlc=0.3   #Marcacoes do eixos (ticks) para dentro da area do grafico 
     , bty ="l"   #Apenas dois eixos (formato "L")
     , main= "diametro por alt"   #TÌtulo informativo
) 

#dois graficos juntos

#Use as variaveis "dap" e "talhao" para construir dois graficos, colocando-os lado a lado. O primeiro deve ser um gr·fico de desenho de caixa (boxplot) da variavel "dap" em funcao do fator "talhao". O segundo deve ter apenas a mÈdia e uma barra de desvio-padrao do dap, para cada talhao.

par(mfrow=c(1,2))
boxplot(esaligna$dap~esaligna$talhao
        , main="(dap e talhao)"  #titulo
        , xlab = "Talh„o"  #titulo eixo x
        , ylab = "dap(cm)"  #titulo eixo y
        )   #grafico um


mtext("(a)", side=3)      ##text para adicionar a

media = tapply(esaligna$dap
               , esaligna$talhao
               , mean) #media de dap e talhao

sd=tapply(esaligna$dap
          , esaligna$talhao
          , sd) #desvio de dap e talhao

plot(media    #grafico dois
     , xlim=c(0,7)   #limite de corte para x
     , ylim=c(0,24)   #limite de corte para y
     , ylab="dap (cm)"
     , xlab="Talh„o"
     ,xaxt="n"    #estilo do eixo x (padr„o ou nenhum) para xant e yant nenhum /
     , yaxt="n"
     , pch=15
     )    

mtext("(b)", side=3)   ##text para adicionar b

#Insira tambÈm uma letra para dizer qual e o grafico "a" e qual È o "b" (tanto faz, quem e um e quem È outro).

#voces terao que calcular a media e os desvios-padrao do dap das ·rvores em cada talhao. Depois crie uma matriz com estes valores e crie o plot destes valores. 

media = tapply(esaligna$dap, esaligna$talhao, mean )
sd = tapply(esaligna$dap, esaligna$talhao, sd)
plot(media
     , xlim=c(0,7)
     , ylim=c(0,24)
     , ylab="dap (cm)"
     , xlab="Talh„o"
     ,xaxt="n"
     , yaxt="n"
     , pch=19
     ) 
segments(x0=c(1,2,3,4,5,6),   #seis locais para os dados
         y0=c(6.633214, 6.961754, 7.366797, 9.896206, 8.433185, 6.864501)
         , x1=c(1,2,3,4,5,6), 
         y1=c(14.10012, 19.00967, 15.89987, 20.86379, 18.74182, 19.43550))  # desvio com o segments
axis(side=1, at=c(1,2,3,4,5,6)  #nomeando a barra inferior de 1 a 6 com os numeros 16 a 32
     , labels=c("16", "17", "18", "22", "23", "32")
     ) 
axis(side=2, at=c(3, 9, 15, 21 )  #nomeando a barra lateral esquerda com os valores
     ) 


#5.3 adivinhando o codigo

#usando as vari·veis "x1" e "y1" e "x2" e "y2" tente reproduzir esta figura: 

grafico = read.csv("C:/Users/paty/Documents/R/exercicio3.csv") 

par(mfrow=c(1,2))  #duas areas de grafico

# Grafico um
plot(grafico$y1~grafico$x1
     , xlab= "Log(Patch size)(ha)"   #nome dos eixos
     , ylab="Euclidean distances"
     , family="mono"   #tipo de fonte
     , font.lab=2  #fonte para nome dos eixos 
     , pch=17     #tipo de simbolo dos pontos
     , bty="l"  #tipo de caixa de texto
     , tcl=0.3   #comprimento dos 'ticks' (em relaÁ„o ao texto) 
     , ylim=c(0,3)  #limite dos dados no eixo y 
     , xlim=c(0.5, 2.25)  #limite dos dados no eixo x 
     )
segments(0.5,2.25,2.15,1.0   #x e y representam coordenadas dos pontos a ser unidos
         ,lwd= 2     #largura da linha
         )   
text(locator(1), "a", cex=1.3)  #inseri a dentro da area do grafico



# Grafico dois
par(tcl=0.3  
    , bty="l"
    , family="mono"
    )
boxplot(grafico$x2~grafico$y2
        , bty="l" #tipo de caixa de texto
        , ylim=c(0,3)   #limite dos dados no eixo y 
        , xaxt="n"  ##estilo do eixo x (padr„o ou nenhum) para xant
        , pch=""  #sem tipo de simbolo
        )    

axis(1  #eixo x
     , at = 1:6  #tamanho das informacoes do eixo x de um a seis
     , labels =c ("Small","Medium\n Edge","Medium\n Interior","Large\n Edge","Large\n Interior","Control") #nomes dos pontos do graficos no eixo x
     , cex.axis=0.8   #tamanho da fonte no eixo x
     , family="mono")  #tipo de fonte 

text(1:5,3  #inserido os textos = *, no eixo x de 1 a 5, e no eixo y no valor tres
     ,c("*","*","**","*","***") #texto informado na sequencia
     ,cex=1.5  #tamanho da fonte
     ,family="serif"  #tipo de fonte
     )  
text(locator(1)
     , "b"
     ,cex=1.3
     ,family="mono"
     )

# o que significa:  text(locator(2), c("meu texto", "outro texto"))
