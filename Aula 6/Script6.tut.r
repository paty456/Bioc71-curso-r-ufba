####### script 6

#PATRICIA MOTA

# Tutoriais de Programacao

media <-function(x)  #funcao para media com os seguintes criterios
{
  soma=sum(x) #soma de x
  nobs=length(x)  # comprimento de x
  media=soma/nobs #media eh a soma dividida pelo comprimento de x
  return(media)  #aplicado ao final da funcao e retorna o objeto entre parenteses
}

ls()  #retornam um vetor de sequencias de caracteres que dao os nomes dos objetos no ambiente especificado
media  #retorna a funcao criada acima
media()  #retornou argumento x que estava ausente
dados=rnorm(20,2,1)  #20 vetor, mean = 2, sd = 1  rnorm: distribuicao normal nomeada com nome dados
media(dados)  #retorna media dos dados para os valores de 20 [1] 1.931954
dados1=rnorm(200,2,1)   #200 vetor, media=2, sd=1 rnorm: distribuicao normal nomeada com nome dados1
media(dados1)  #retorna media dos dados para os valores de 200 [1] 1.903296
dados2=(rnorm(10000,2,1)) #10000 vetor, mean = 2, sd = 1  rnorm: distribuicao normal nomeada com nome dados2
media(dados2) #retorna media dos dados para os valores de 1000 [1] 2.005259
sd(dados)  #desvio padrao de dados [1] 1.079911
dados3=rnorm(20,2,0.01) #20 vetor, mean = 2, sd = 0.01  rnorm: distribuicao normal nomeada com nome dados3
media(dados3) #retorna media dos dados para os valores de 20 [1] 1.998167
dados4=rnorm(200,2,0.01) #200 vetor, mean = 2, sd = 0.01  rnorm: distribuicao normal nomeada com nome dados4
media(dados4) #retorna media dos dados para os valores de 200 [1] 1.99887
dados[2]<-NA #substituindo para a segunda linha dos dados para NA
dados
media(dados)  #media dos dados com NA


media<-function(x,rmNA=TRUE)  
{
  if(rmNA==TRUE)  # if condicao a ser testada para calcular media com a presenca de NA
  {
    dados=(na.omit(x))  #dados eh NA omitido de X
    n.NA=length(x)-length(dados) #n.na eh o nome dado para o comprimento de x diminuido pelo comprimento de dados, retirando os NA
    cat("\t", n.NA," valores NA excluídos\n")  #concatena-os para um único vetor de caracteres, depois os exibe.
  }
  
  else
  {
    dados=x
  }
  soma=sum(dados)  #soma dps dados
  nobs=length(dados)  #comprimento de x
  media=soma/nobs #media eh a soma dividida pelo comprimento de x
  return(media)  #aplicado ao final da funcao e retorna o objeto entre parenteses
}


var.curso<-function(x)  #funcao para calcular variancia
{
  media=media(x)
  dados=na.omit(x)	#na omitido de x
  disvquad=(dados-media)^2  #dados com NA omitidos de x - a media elevado a 2
  var.curso=sum(disvquad)/(length(dados)-1) #variancia de curso eh soma de disvquad dividido pelo comprimento de dados
  return(var.curso) #aplicado ao final da funcao e retorna o objeto entre parenteses
}

var.curso(dados)  # Calcula a variancia de dados e comparando com a funcao do R! 
var(dados) # 1  variancia dos dados retornando valores de 1 NA excluídos [1] 1.200183
var(dados,na.rm=TRUE) #retorna a variancia dos dados com a remocao de NA mostrando os valores apos a retirada de NA 
var(dados,na.rm=FALSE) #retorna a variancia dos dados com a presenca de NA mostrando os valores com a presenca de NA ainda, pois n foi retirado o na.rm =false, logo aparece NA


ID.curso<-function(x) #indice de dispersao para as contagens da amostra
{
  id=var.curso(x)/media(x) #indice eh a razao da variancia do curso dividido sobre a  media
  return(id) # #aplicado ao final da funcao e retorna o objeto entre parenteses
}


aleat=rpois(200,2) #distribuicao de poisson com 200 valores e lambda, aleatoriza os valores em torno da media que eh dois 

unif=runif(200,0,4) #distribuicao uniforme com 200 valores de minimo de 0 a maximo de 4
unif
unif=round(unif,0) #arredonda os valores em seu primeiro argumento 0 para o numero especificado de casas decimais, aproximando para numeros inteiros
unif

agreg=round(c(runif(100,0,1),runif(100,5,10)))  # round aproxima para os valores inteiros as distribuicoes uniformes dos dois vetores entre parenteses 
agreg

ID.curso(aleat) #coeficiente de dispersao para os objetos aleat  dado aleatorio [1] 1.065267

ID.curso(unif) #coeficiente de dispersao para os objetos unif  /  0.731841

ID.curso(agreg) #coeficiente de dispersao para os objetos agreg  / dado aleatorio [1] 3.515852

#quanto mais proximo de um a distribuicao eh a aleatoria

test.ID <- function(x, nsim=1000)  #funcao para teste de significancia do indice de dispersao
{ 
  ID.curso=function(x){var(x)/mean(x)}# essa funcao precisa das funcoes media e ID.curso
  dados=na.omit(x)
  ndados=length(dados)
  med=mean(dados)
  id=var(dados)/med
  simula.aleat=rpois(length(dados)*nsim, lambda=med)
  sim.dados=matrix(simula.aleat,ncol= ndados)
  sim.ID=apply(sim.dados,1,ID.curso)
  quant.ID=quantile(sim.ID, probs=c(0.025,0.975))
  if(id>=quant.ID[1] & id<=quant.ID[2])
  { 
    cat("\n\n\n\t distribuição aleatória para alfa=0.05 \n\t ID= ",id,"\n\n\n")
  }
  if(id < quant.ID[1]) 
  { 
    cat("\n\n\n\t distribuição uniforme, p<0.025 \n\t ID= ",id,"\n\n\n")
  }
  if(id>quant.ID[2])
  { 
    cat("\n\n\n\t distribuição agregado, p>0.975 \n\t ID= ",id,"\n\n\n")
  }
  resulta=c(id,quant.ID)
  names(resulta)<-c("Indice de Dispersão", "critico 0.025", "critico 0.975")
  return(resulta) #aplicado ao final da funcao e retorna o objeto entre parenteses
}

test.ID(aleat)  #testando os dados para o obj aleat para alfa 0.05, com ID 1.065267
test.ID(agreg) #testando os dados para o obj agreg para p>0.975 com ID 3.515852
test.ID(unif) #testando os dados para o obj unif para p<0,025 com ID 0,731541


eda.shape <- function(x)  #outra funcao
{
  x11() 
  par(mfrow = c(2,2))	## muda o dispositivo gráfico para 2x2
  hist(x)                 ## produz histograma de x
  boxplot(x)   #produz boxplot de x
  iqd <- summary(x)[5] -	summary(x)[2]     ## faz a diferença entre o quinto elemento x e o segundo elemento 
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l") #formatacao dos plot
  qqnorm(x) #gráfico quantil-quantil (q-q)
  qqline(x) #acrescenta uma linha a uma parcela quantile-cuantil normal que passa pelo primeiro e terceiro quartis.
  par(mfrow=c(1,1)) #muda a apresentacao dos graficos para 1x1
  
}

set.seed(22) ## estabelece uma semente aleatória 
dados.pois20<-rpois(20,lambda=6) ## sorteia dados aleatorios de uma funcao poisson com media 6
sum(dados.pois20) ## a somatoria aqui sempre darah 131, somente porque a semente eh a mesma
set.seed(22)
dados.norm20<-rnorm(20,mean=6, sd=2) ## sorteia 20 dados de uma funcao normal com media 6 e dp = 1
sum (dados.norm20)               ### aqui o resultado darah sempre 130.48

###aplicar eda.shape para dados.dens

eda.shape(dados.pois20)  #aplica a funcao para dados.pois20 que refere a dados aleatorios de uma funcao poisson com media 6

eda.shape(dados.norm20) #plica a funcao apra dados.norm20 que refere a uma funcao normal com media 6 e dp = 1

###aumentando a amostra

eda.shape(rpois(500,6)) ##aplica a funcao para rpois(500,6) que refere a dados aleatorios de uma funcao poisson com media 6, de 500 valores

eda.shape(rnorm(500,6)) ##aplica a funcao para (rnorm(500,6)  que refere a uma funcao normal com media 6 de 500 valores

eda.shape1 <- function(x)
{
  x11() #plotar grafico
  par(mfrow = c(2,2))
  hist(x,main="Histograma de x")
  boxplot(x, main="BoxPlot de x")
  iqd <- summary(x)[5] -	summary(x)[2]
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribuição de densidade de x")
  qqnorm(x,col="red",main="Gráfico Quantil x Quantil",xlab="Quantil Teórico",ylab="Quantil da Amostra")
  qqline(x) 
  par(mfrow=c(1,1))
  
}

eda.shape1(rnorm(500,6)) #executando a funcao c alteracoes sobre a funcao rnorm de distribuicao normal com media 6 e 500 valores


x1=rpois(20,1) #sorteia dados aleatorios com 20 dados e media 1
x2=rpois(20,2) #sorteia dados aleatorios com 20 dados e media 2
x3=rpois(20,3) #sorteia dados aleatorios com 20 dados e media 3
x4=rpois(20,1) #sorteia dados aleatorios com 20 dados e media 1
sp.oc=matrix(c(x1,x2,x3,x4), ncol=4) #criacao de matrix com os dados concatenados de x e com 4 colunas
colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D") #nomeando as colunas
rownames(sp.oc)<-paste("sp", c(1:20)) #nomeando as linhas e concatenandos o vetor sp  para as linhas e colunas

str(sp.oc) #Exibe rapidamente a estrutura interna de um objeto R, uma funcao de diagnostico e uma alternativa ao resumo
dim(sp.oc) # retorna os comprimentos do atributo row.names de x e de x (como numeros de linhas e colunas, respectivamente) 20 linhas e 4 colunas
head(sp.oc) #Retorna a primeira ou a ultima parte de um vetor, matriz, tabela, quadro de dados ou funcao

n.spp<-function(dados)
{
  nplot=dim(dados)[2]  #retorna os comprimentos de dados e coluna 2 nomeado com NPLOT
  resultados=rep(0,nplot) #replica o valor x que 0 dentro de nplot, nomeado como resultados
  names(resultados)<-paste("n.spp", c(1:nplot)) # concatena n.ssp para a combinacao partindo de 1 para os dados de nplot, nomeado como names resultados
  dados[dados>0]=1 #dados maiores que 0 serao adequados como 1
  for(i in 1:(dim(dados)[2])) # logica da funcaoo for() eh que o contador (i) tera um valor diferente a cada ciclo, caso o seja 1,adequado anteriormente os dados retornarao como comprimento dos mesmos na coluna 2
  {
    cont.sp=sum(dados[,i]) #os dados serao somados de todas as linhas para as colunas na qual foi realizado o teste de logica, nomeado como cont.sp
    resultados[i]=cont.sp #resultados[i] mostra os valores de cont.sp
  }
  return(resultados) #aplicado ao final da funcao e retorna o objeto entre parenteses
}


##### Aplicando a funcao 

n.spp(sp.oc)


sim<-function(dados)
{
  nplot=dim(dados)[2]  #retorna os comprimentos de dados e coluna 2 nomeado com NPLOT
  similar=matrix(1,ncol=nplot,nrow=nplot)  #matriz para conjunto de dados para o vetor 1, nas linhas e colunas de NPLOT
  rownames(similar)<-paste("plot", c(1:nplot)) #concatenacao de plot para a combinacao partindo de 1 para os dados de nplot, nomeado como rownames nas linhas
  colnames(similar)<-paste("plot", c(1:nplot))#concatenacao de plot para a a combinacao partindo de 1 para os dados de nplot, nomeado como colnames para as colunas
  dados[dados>0]=1 #dados maiores que 0 serao adequados como 1
  for(i in 1:nplot-1) # logica da funcaoo for() eh que o contador (i) tera um valor diferente a cada ciclo, caso o seja 1,adequado anteriormente os dados retornarao como nplot menos 1
  
    m=i+1 
    for(m in m:nplot) #se m estiver no nplot, serah adicionado mais um 1 valor
    {
      co.oc=sum(dados[,i]>0 & dados[,m]>0) #soma os dados em todas as linhas, seguindo a logica de nplot -1 for maior que 0, e os dados em todas as linhas para a condicao de m=i+1 
      total.sp=sum(dados[,i])+sum(dados[,m])-co.oc  # soma de dados maiores que 0 em todas as linhas e colunas com NPLOT-1 com soma dos dados em todas as linhas para a condicao de m=i+1 diminuindo por co.oc=sum(dados[,i]>0 & dados[,m]>0) que equilave a condicao acima
      similar[i,m]=co.oc/total.sp  #  co.oc dividido pelo total.sp 
      similar[m,i]=co.oc/total.sp  #  co.oc dividido pelo total.sp 
    }
    
  }
  return(similar)#aplicado ao final da funcao e retorna o objeto entre parenteses


#Exercicios 9 - Construcao de Funcoes
saida <- function(x,y)
{
  
  par(mfrow= c(1,1)) #grafico 1x1
  hist(x,y, ylab = "quantidade") #HISTOGRAMA com eixo x e y onde no eixo y sera a quantidade de y
  boxplot(x,y, names = c("x","y")) #dos eixo x e y concatenando os nomes x e y
  plot(y~x, col= col="blue") #plot de variavel y e x com cor azul
  
  qqnorm(x, col= "red")# qqnormal da variavel x, cor referente 
  qqline(x, col= "red") #linhas no plot x com cor referente
  qqnorm(y, col= "green") # qqnormal da variavel y, cor referente 
  qqline(y, col="green") #linhas no plot y com cor referente 
  
  par(mfrow= c(2,2)) #grafico por 2x2 
  hist(x,y, ylab = "quantidade") #HISTOGRAMA com eixo x e y onde no eixo y sera a quantidade de y
  boxplot(x,y, names = c("x","y")) #dos eixo x e y concatenando os nomes x e y 
  plot(y~x, col="blue") #plot de variavel y e x com cor azul
  
  qqnorm(x, col= "red") # qqnormal da variavel x, cor referente 
  qqline(x, col="red", lwd=3) #linhas no plot x com cor referente e espessura do tipo 3
  qqnorm(y, col= "blue") # qqnormal da variavel y, cor referente  
  qqline(y, col="blue", lwd = 3)#linhas no plot  y com cor referente e espessura do tipo 3
  
  }

x= rnorm 
y=rnorm 