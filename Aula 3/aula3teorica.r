getwd()
setwd("C:/Users/paty/Documents")

#usar barra contra a barra
source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/scriptOnline.R")
#não utilizar script desconhecidos
caixeta = read.csv("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/caixeta.csv")
caixeta

#source carrega todos os scripts
# 4 # separa os scripts em secoes
list.files() #lista todos os artigos do diretorio que documentos
aulas = list.files(pattern = "aula") # arquivos que possuam "aula"" em qualquer lugar do nome
aulas #so retorna os arquivos com nome aulas, nao lista o que tem de conteudo no arquivo
script =list.files(pattern = "\\.csv$") #lista os arquivos com essa terminacao csv
source("..//..//arquivos/toroidal.distance.R") # ../ volte um arquivo, ira executar e carregar para a memoria do script
# ponto final separador de decimal e virgula separador de coluna
# header = TRUE, #interpreta a primeira linha como sendo o nome das colunas


arquivoLido =read.csv(file = "/Documents/caixeta.csv", 
                      header = TRUE, #interpreta a primeira linha como sendo o nome das colunas
                      as.is = TRUE , # não altera interpreta o tipo de dado em cada coluna, não altera seus dados. Se for FALSE, texto é interpretado como factor
                      sep = ",", # define o caractere que deve ser o separador de colunas
                      dec = "." #define o caractere que deve ser o spearador de decimal
)
getwd()

library(writexl)
library(readxl)
write_xlsx(mtcars,"mtcars.xlsx")
out <- read_xlsx("mtcars.xlsx")
