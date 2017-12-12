######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#Aula 02
gitub

#quando possível, sua resposta deve ser um código do R

#####Trabalhando com dados#####
# o que é um dataframe? Qual a diferenca entre um dataframe e um list?
 #dataframe aceita numeros e caracteres como se fosse uma matriz de dados, e a funcao list, lista os conjuntos de dados

# o que as funcoes abaixo fazem? O que elas retornam?
is.vector("vector") # indica se is.vector e o vector mencionado entre parenteses, retorna um vetor logico
is.numeric(5) # indica se is.numeric e o numeric mencionado entre parenteses, retorna true
is.character("a") # verifica se character e um character, retorna true /retornar: resposta da funcao
is.matrix(pesos) # verifica se matrix e pesos, retorna false
is.na(pesos) # verifica se tem NA em pesos, retorna false nos dados de pesos pois n tem dado faltante
is.data.frame(pesos) # verifica se data.frame e pesos, retorna como false

#o que queremos dizer quando dizemos uma função "retorna" alguma coisa?
#que verifica algo solicitado na funcao

#o que a funcao summary() faz?
#sumariza todos os dados no console, tb valores estatisticos 

#Tres areas foram submetidas aplicacao de tres adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram: # dados com tamanhos de numeros diferentes

#(Controle)	 
a	=c(37,	34,	36,	42,	31,  33)
b	= c(62,	54,	57,	64,	60)
c = c(63,	58,	60,	62,	61, 44)
d	= c(41,	37,	38,	49,	35, 49)
#Crie um dataframe com estes dados

tratamento = c(rep("a",6),rep("b", 5),rep("c", 6),rep("d",6)) #repetindo os valores de tratamento
pesos = c(37, 34,	36,	42,	31, 33, 62,	54,	57,	64,	60, 63,	58,	60,	62, 61, 44, 41,	37,	38,	49,	35, 49)
ls()
nomesColunas = c("tratamento", "pesos")
adubo = data.frame(tratamento, pesos)


#Calcule a media de cada tipo de adubo, sem usar summary(), usando o dataframe
#que voce criou acima


mean(adubo[adubo$tratamento == "a",]$pesos)
mean(adubo[adubo$tratamento == "b",]$pesos)
mean(adubo[adubo$tratamento == "c",]$pesos)
mean(adubo[adubo$tratamento == "d",]$pesos)


#que problemas você teve ao fazer o exercício acima?
#nomear as variaveis tratamento e pesos, para adicionar as colunas
unique(adubo)
# O que a função unique() faz? # unique(adubo) retorna os dados sem valores repetidos

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas espécies estão presentes na coluna especie. Para ler o arquivo, execute
#o código abaixo
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
# o arquivo deve estar no seu diretório de trabalho
getwd()
str(caixeta) #o que este comando faz?  #cria um resumo dos dados da caixeta
summary(caixeta) 

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar lá. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
#diff diferen?as no mesmo vetor

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada árvore difere da média de todas as árvores

caixeta$desvio = caixeta$h-mean(caixeta$h)  #vetor caixeta$h - outro vetor caixeta$h
mean(caixeta$h) #90.28238

desvio =caixeta$h-mean(caixeta$h) 
caixeta$desvio =desvio    #x objeto que ser? inserido y recebido == cbind
#Usando a função table(), conte quantos indivíduos de cada espécie existem
table(caixeta$especie)  #tabela de contigencia

#A funcao table() também pode contar por espécie em cada local, depois por local
#em cada espécie). Como?

table(caixeta$especie, caixeta$local)
table(caixeta$local, caixeta$especie)

#crie um objeto chamado pequenas que contenha todas as árvores com altura (h)
#menor que um metro.(Os dados no arquivo estão em centímetros)]
pequenas = caixeta[(caixeta$h < 100),] #caixeta = objeto e caixeta$h = vetor. Tudo em parenteses eh um vetor

#crie um objeto chamado grandes que contenha todas as árvores acima de 3 metros
grandes = caixeta[(caixeta$h > 300),]
#crie um objeto chamado medias que todas as árvores com alturas entre um metro e
#tres metros

medias = caixeta[caixeta$h>=100 & caixeta$h<=300,] #obejto media
medias
 #aora em uma linha de comando, crie um objeto que contenha a quantidade de
#árvores pequenas, médias e grandes, separadamente

todas=c(length(pequenas$local),length(medias$local),length(grandes$local))
todas
dim(pequenas) #dimensoes dos valores , referente aos valores das linhas de cada objeto, 442 observacoes, 584 observacoes e 1 observacoes
 
#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta espécie ocorre? Qual comando para
#encontrar essa informação?

obj = caixeta[caixeta$especie=='Alchornea triplinervia',] 
length(obj) #7
table(obj$local) # 3 jureia e 12 retiro
length(unique(obj$local)) #dois

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),] #caixeta[ remova todas as informacoes posteriores]
sort(
  unique(caixeta.sem.tabebuia$especie)) #sort em ordem alfabetica

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)

caixeta.sem.tabebuia = caixeta[!c(
        caixeta$local == "retiro" 
          &
          caixeta$especie == "Tabebuia cassinoides"),]

   #menos algo

#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a notação acima (dica: só se usa "" para valores do tipo
#character)
  
id = 1:80 

a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,     209.9109, 210.9228)

comNa =data.frame(id,c(a,b,c,d)) #80
semNa =comNa[!is.na(comNa$c.a..b..c..d.),]

semNa2 =na.omit(comNa)  # 74
View(semNa)

#Abaixo temos dados de tamanho de mand?bula de chacal dourado. Crie um dataframe
#com esses dados. Qual a m?dia por sexo? E para a esp?cie? Guarde estes valores
#em tres objetos diferentes.

machos = c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
femeas = c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
media.m =mean(machos)
media.f =mean(femeas)
media.sp =mean(c(machos,femeas))
chacais =data.frame(machos,femeas) #ajusta os dados juntos

#Quantos machos t?m a mand?bula
#maior do que a m?dia das f?meas?

machosgrandes = machos[machos > media.f] #ajustando os dados separados
View(machosgrandes)
machosgrandes
machos.grandes2 =chacais$machos[chacais$machos > media.f]
femeas.2 =chacais$femeas[chacais$femeas < media.m] #femeas com medidas menores do q a media das machos
View(femeas.2)

#escreva **uma** linha de c?digo que testa se um n?mero ? par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a fun??o %% (resto da divis?o, ou
#remainder em ingl?s) e a fun??o message()

if(7%%2==0){message("par")}
if(x>4*mean(dados)){dados[-x]}
  #se x for maior que 4, nas media dos dados,nos dados ser? retirado o
if (pi%%2 ==0){
  message("par")
}else{
  message("impar")
}

 

#agora crie um c?digo  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as fun??es else e ifelse


#crie um ciclo (for) que mostre o console todos os inteiros de 1 at? 10, um por
#um

for (i in 1:10) {
  a = i^2
  message(a)
}

for (i in 20:2) #sequencia com quantas vezes irah repetir seu codio abaixo
  message(i) #i eh um objeto #insira seu codigo repetitivo aqui


#crie um ciclo (for) que some todos os inteiros de 25 at? 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#c?digo do ciclo)
objeto.soma = c(25:43)
soma=0
soma = soma + 1
message(soma)

for (i in 25:43) {
  soma =soma+i
  message(soma)
}


#####Desafio level Hard#####
#Escreva um c?digo que escreva os n?meros de um a 100, com as seguintes
#condi??es: Se o n?mero for multiplo de 3, ao inv?s do d?gito, escreva "Fu". Se
#o n?mero for m?ltiplo de 5, ao inv?s do d?gito, escreva "b?". Para n?meros que
#forem multiplos tanto de 3 quanto de 5, escreva "Fub?". A melhor solu??o ganha
#um chocolate 

#fizzbuzz vectorial

#paste cola informacoes
for (i in 1:100) {
  if (i %% 3==0 & i %% 5==0) {
    message ("fuba")
  } else if (i %% 3 ==0) {
        message ("fu")
  } else if (i %% 5 == 0){
    message ("ba")
    }else message (i)
          }
         

s=1:100
s[seq(3,100,3)] = 'Fu'
s[seq(5,100,5)] = 'b?'
s[seq(15,100,15)] = 'Fub?'
message("Fu")
View("Fu")


