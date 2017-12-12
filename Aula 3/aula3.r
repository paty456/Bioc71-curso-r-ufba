######################################################
# Introdução Linguagem R                          ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################

#diferencie a função source da função load()
#função source executa todos os comandos dentro do arquivo e o load coloca o conteudo do arquivo para dentro de um objeto

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R", destfile = "distancias.csv")

#Abra toroidal.distances.R no R

# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R?

source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R")

# Faça o procedimento que você descreveu acima

#utiliza a funcao source

# Faça o procedimento que você descreveu acima
source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R") 
# executar o source 

# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

#ao abrir o arquivo alterado nome da primeira funcao para distance.matrix e posteriormente salva

# Carregue o arquivo distancias.csv para dentro do objeto distancias
#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100

distancias=read.csv("distancias.csv") #carrega o arquivo distancias.csv para o objeto distancias 
distance.matrix(distancias, tam = 100) 
distancia = distance.matrix(distancias, tam = 100) #chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100

# O que aconteceu?
#foi gerado dados de distancias ate 1 a 100 pontos

# O que você precisa fazer para que você possa usar a função distance.matrix?
# funcao source (carrega novamente o arquivo)

# Salve o resultado do comando acima com o nome de matriz.distancias.csv

write.csv(distancia,file = "matriz.distancia.csv") 
     
  # Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (não abra o excel nem salve em .csv)

download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx", destfile = "DnD") 
getwd()
setwd("C:/Users/paty/Desktop/R")
DnD = ("dragoes.xlsx")

DnD = read_xlsx("dragoes.xlsx")

# Confira a estrutura do arquivo 
#20 obs. de 6 variaveis
view(DnD)

# Há algum NA? houve algum problema com o cabeçalho?

is.na("dragoes") #false 
#o R indica que nao ha NA mas ao usar head(dragoes) é possível ver que há NA.
#cabecalho com nome dragoes acentuado

head(dragoes)

# Refaça o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv

caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
caixeta$coletor= "Darwin" 
caixeta$desvio =caixeta$h-mean(caixeta$h) 
write.csv(caixeta, 'caixeta_com_desvio.csv')

