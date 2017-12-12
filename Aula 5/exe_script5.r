####### PATRICIA MOTA
#4. Tutoriais de Análise Exploratória de Dados

getwd() 
aves.c = read.csv("C:/Users/paty/Documents/R/aves_cerrado.csv")  
#leitura e nomeacao dos dados em aves.c

aves.c <- read.table("C:/Users/paty/Documents/R/aves_cerrado.csv", row.names=1, header=T, sep=";", dec=",", as.is=T)  #lendo a planilha
aves.c <- read.csv2("C:/Users/paty/Documents/R/aves_cerrado.csv", row.names=1, as.is=T)

head(aves.c)  #ler a funcao de porcoes superiores de um arquivo
tail(aves.c)  #ler a funcao das porções inferiores do arquivo
str(aves.c) #   exibe a estrutura interna do objeto (x), informando o tipo de objeto,número de observações e classe de cada variavel.
summary(aves.c) # a função retorna media, mediana, mínimo e máximo da variavel x

aves.c[aves.c$urubu==NA,]   #verificacao dos NA tabela aves, coluna urubu
is.na(aves.c)  #teste logico sobre os Na na tabela aves.c 
is.na(aves.c$urubu)  ##teste logico sobre os Na para uma das aves

aves.c[is.na(aves.c$urubu),]     #indexacao de um dos vetores
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #indexacao de um dta frame

temp1 = aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #criaco no objeto . verificacao dos NA

aves.c$urubu[is.na(aves.c$urubu)] <- 0  #substituicao dos NA em O para coluna urubu
aves.c[is.na(aves.c$urubu),2] <- 0 #outra maneira de substituicao dos NA em O para coluna urubu
aves.c[is.na(aves.c[,2]), 2] <- 0 #outra maneira de substituicao dos NA em O para coluna urubu

aves.c$carcara[is.na(aves.c$carcara)] <- 0  #para as outras aves, substituindo NA em 0,
aves.c$seriema[is.na(aves.c$seriema)] <- 0  #para as outras aves, substituindo NA em 0,

aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,] 
#indicando que os valores deverao ser 0, substituindo os NA para 0

table(aves.c$fisionomia) #verificacao dos valores da coluna fisionomia para um fator, indicando a quantidade para cada CC ce Ce CL 20  1 19 20 

aves.c$fisionomia[aves.c$fisionomia=="ce"] <- "Ce" # trocando o nome ce por Ce 
table(aves.c$fisionomia)  #verificando a coluna apos a alteracao

aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce")) #  Convertendo para fator, que ordenamos da fisionomia mais aberta para a menos: 

str(aves.c)  #exibe a estrutura interna do objeto (x), informando o tipo de objeto,número de observações e classe de cada variavel.
summary(aves.c)   #verificando as alteracoes

mean(aves.c[,2:4])  #In mean.default(aves.c[, 2:4]) :argumento não é numérico nem lógico: retornando NA

sapply(aves.c[ ,2:4],mean) # Aplica uma funcao a cada elemento de uma lista, e retorna uma vetor com os resultados fisionomia      urubu    carcara NA   11.73333   10.08333
sapply(aves.c[,2:4],median) #  urubu carcara seriema 12       9       5

apply(aves.c[,2:4],2,median)  #aplica a funcao mediana para todas as linhas ou colunas, resultando o mesmo dado do acima

quantile(aves.c$urubu) ## indica a mesma coisa que o summary, no entanto quantile indica com as porcentagens de 0% a 100%
summary(aves.c$urubu)  # indica com dados de minimo, 1 quartil, mediana, media 3 quartil e maximo

quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1))  #mudando os quantis 

summary(aves.c[,2:4]) #quantis, medias e medianas de todos

###Exploração de uma Variável Categórica

caixeta <- read.csv("C:/Users/paty/Documents/R/caixeta.csv", as.is=T)  #leitura da planilha
names(caixeta)  #nome das colunas da caixeta
table(caixeta$especie)  # esta função retorna a distribuicao de frequencia absoluta das categorias na variável x

sort(table(caixeta$especie), decreasing=T)  #sort faz uma classificação (crescente ou decrescente), no caso classificou de maneira descrescente

barplot(sort(table(caixeta$especie), decreasing=T))  # barplot da frequencia absoluta de caixeta por especie com valores descrescendo

barplot(table(caixeta$local)) # barplot da frequencia absoluta das categorias de caixeta local

par(mfrow=c(2,2)) #duas areas de grafico,em duas linhas e duas colunas
boxplot(aves.c$urubu) #boxplot de aves coluna urubu
hist(aves.c$urubu)  #histograma de aves e urubu
plot(density(aves.c$urubu)) #plot de densidade de aves para a coluna urubu
stripchart(aves.c$urubu, method="stack")  #plots usados quando o tamanho da amostra eh pequeno, com metodo stack para ter os pontos coincidentes
par(mfrow=c(1,1)) #fica somente um grafico devido a solicitacao de 1 linha e 1 coluna

hist(aves.c$urubu) #histograma de frequencia de aves na coluna urubu
rug(jitter(aves.c$urubu))  #Adiciona uma representação de tapete nos dados ao grafico, com varias informacoes no vetor.
rug(aves.c$urubu)  #dimunui as informacoes no vetor x


hist(aves.c$urubu, prob=T) #histograma de densidade probabilistica por aves coluna urubu
lines( density(aves.c$urubu),col="blue" )  #colocando linhas de cor azul sobre os dados de densidade de urubus

hist(aves.c$urubu, prob=T)
curve(expr = dnorm(x  #atribuindo a funcao de distribuicao normal
                   ,mean=mean(aves.c$urubu)  #media 
                   ,sd=sd(aves.c$urubu))  #desvio
                   ,add=T
                    , col="red" #cor vermelha para a curva
      )  
           
plot(density(  #plot de densidade para a coluna urubu
  aves.c$urubu)
  ,col="blue" # cor azul para a linha da curva
  , ylim=c(0,0.08)  #limite de dados no eixo y 
  )
curve(expr = dnorm( #atribuindo a funcao de distribuicao normal
  x,mean=mean(aves.c$urubu)  #media da coluna urubu
  ,sd=sd(aves.c$urubu)) #desvio da coluna urubu
  ,add=T  
  , col="red"
  )
#sobreposicao de informacoes da densidade probabilista de urubus e curva normal 

#urubus estao sendo avistados proximo a curva normal , porem com pico que se afasta da normal, sendo os valores altos proximos a faixa de 15 a 20 , evidenciado pela curva de linha azul

table(caixeta$especie,caixeta$local)  #retorna a distribuicao das frequencias absolutas

caixeta.alt <- aggregate(caixeta$h, by=list(local=caixeta$local,especie=caixeta$especie),
                         FUN=mean)  #aggregate junta uma variavel categorica e uma nuemrica, retornando em um dataframe


titanic = read.csv("C:/Users/paty/Documents/R/titanic.csv", as.is=T)  #lendo a planilha

xtabs(Freq~Sex+Survived, data=titanic)  #criacao de uma tabela de contigencia a partir de informacoes cruzadas = titanic e os sobreviventes por sexo
prop.table(xtabs(Freq~Sex+Survived, data=Titanic), margin=1)  #cria uma tabela com as infomacoes mais detalhadas sobre a proporção dos sobreviventes por sexo
xtabs(Freq~Class+Survived, data=Titanic) #criacao de uma tabela de contigencia a partir de informacoes cruzadas = titanic e classe economica dos sobreviventes
prop.table(xtabs(Freq~Class+Survived, data=Titanic), margin=1) #cria uma tabela com as infomacoes mais detalhadas sobre a proporção dos sobreviventes por classe economica

table(titanic$Sex,titanic$Survived) #pq neste só existe a contabilização de quantos sobreviveram ou nao por sexo pela contagem a partir da coluna sexos, n mostra a frequencia

#Fórmula Estatística em Gráficos

boxplot(urubu~fisionomia, data=aves.c)      #boxplot dos dados da variavel dependente= urubu e a variavel preditora= fisionomia dos dados da dataframe aves
plot(seriema~urubu, data=aves.c, subset=fisionomia=="Ce")  #plot da VD = seriema por PREDITORA =urubu, do data frame aves para o subconjunto da fisionomia do tipo Ce
plot(seriema~urubu, data=aves.c, subset=fisionomia=="CC") #plot da VD = seriema por PREDITORA =urubu, do data frame aves para o subconjunto da fisionomia do tipo CC
plot(seriema~urubu, data=aves.c, subset=fisionomia!="CL")  #plot da VD = seriema por PREDITORA =urubu, do data frame aves para o subconjunto da fisionomia do tipo CL 


#para cada fisionomia existe uma dispersao dos dados

library(lattice)  #pacote de visualizacao de dados com enfase em dados multivariados
xyplot(seriema~urubu|fisionomia, data= aves.c)  #xyplot produz diagramas de dispersão bivariados ou séries temporais
#combinação dos plots listados acima

#O quarteto de Anscombe

data(anscombe)  #carrega para a area de trabalho
ls()   #agora o objeto está no workspace
names(anscombe)  #x1 a x4 (variáveis independentes ou preditoras)  e y1 a y4 (variáveis dependentes ou resposta)

apply(anscombe[1:4], MARGIN=2, FUN=mean)  # medias das variaveis x
apply(anscombe[5:8], 2, mean)  #medias das variaveis Y

apply(anscombe[1:4], 2, var) #variancia de x
apply(anscombe[5:8], 2, var) #variancia de y

#relacao entre as variaveis x e y? 0 nenhuma correlacao a 1 correlacao
with(anscombe,cor(x1,y1)) # 0.8164205
with(anscombe,cor(x2,y2)) #0.8162365
with(anscombe,cor(x3,y3)) #0.8162867
with(anscombe,cor(x4,y4)) # 0.8165214
#sao bem correlacionados aparentemente


#graficos

par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe)
plot(y2~x2, data=anscombe)
plot(y3~x3, data=anscombe)
plot(y4~x4, data=anscombe)
par(mfrow=c(1,1))


#linhas de regressao linear

par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe,   #plot da VD y1 e preditora X1 do data frame anscombe
     xlim=range(anscombe[,1:4])  #limite de dados do eixo x
     ,ylim=range(anscombe[,5:8])  #limite de dados do eixo y
     )
abline(lm(y1~x1, data=anscombe))  #adiciona uma ou mais linhas retas atraves do grafico atual.
plot(y2~x2, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y2~x2, data=anscombe))
plot(y3~x3, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y3~x3, data=anscombe))
plot(y4~x4, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y4~x4, data=anscombe))  #pelo grafico n aparenta ser correlacionado, logo n foi bem ajustado para o modelo de regressao. O valor de R nem sempre eh o suficiente para mostrar uma relacao, sendo necessario plotar em graficos para verificar se foi bem ajustado
par(mfrow=c(1,1))


#Exercícios 4 - Análises Exploratórias

#cerveja 
cervejas <-c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata")

cervejas.table = table(cervejas)   #nomeando a frquencia de cervejas
str(cervejas.table)  #exibe a estrutura interna do objeto (x), informando o tipo de objeto,número de observações e classe de cada variavel
summary(cervejas.table)  #sumariza as informacoes de cerveja 
barplot(sort(cervejas.table, decreasing=TRUE)) # barplot da frequencia absoluta de cerveja com valores descrescendo
barplot(cervejas.table)  # barplot da frequencia absoluta de cerveja
dotchart(cervejas.table) #Arruma os pontos de acordo com o valor (eixo x), e a ordem nos dados (eixo y) 

#Qual tem maior razão dado/tinta? é o dotchart
#caixeta
caixeta = read.csv("C:/Users/paty/Documents/R/caixeta.csv", as.is=T)
names(caixeta) #nomes da colunas
str(caixeta) #exibe a estrutura interna do objeto (x)

hist(caixeta$cap)  # Construa um histograma do dap1 dos fustes dos caixetais.

#Construa histogramas da altura das arvores para os diferentes caixetais ('local').

hist(caixeta$h[caixeta$local=='jureia'])  #local jureia

hist(caixeta$h[caixeta$local=='chauas'])  #local chauas

hist(caixeta$h[caixeta$local=='retiro'])  #local retiro

# Há diferenças entre as estruturas (distribuição de tamanhos) dos caixetais?
# Sim, o chauas apresenta maiores valores proximo a 100

#eucalipto
egrandis = read.csv("C:/Users/paty/Documents/R/egrandis.csv", sep = ";", as.is=T)
head(egrandis) #Retorna a primeira ou a última parte de um vetor, matriz, tabela, quadro de dados ou funcao
 
library(lattice) #pacote de visualizacao de dados com enfase em dados multivariados

class(egrandis$rotacao)  #com base na classe do primeiro argumento para a funcao generica.
class(egrandis$regiao)

egrandis$rotacao=factor(egrandis$rotacao)

table(egrandis$rotacao)  #retorna a frequencia absoluta de egrandis por rotacao
table(egrandis$regiao) #retorna a frequencia absoluta de egrandis por regiao

boxplot(dap~regiao|rotacao, data=egrandis)  #VD dap e preditora REGIAO e combinado com a rotacao, do data frame egrandis


qqnorm(egrandis$ht); qqline(egrandis$ht, col="blue")  #qqnorm é uma função genérica cujo método padrão produz um gráfico QQ normal dos valores em y.
class(egrandis$ht)

#a distribuição da altura (ht) do conjunto das arvores n está de acordo com a linha de distribuição normal, representado pela linha azul no grafico

