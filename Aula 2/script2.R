######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72,3
# -38.3
# erro inesperado

# use pontos como separador de decimal. O que acontece se você usar virgula?

78 / 3 # o / divide o número 78 e 3, resultando 26
2 ^ 3 # o ^ significa o número 2 elevado a 3, resultando 8
3 * 2 # o * significa a multiplicação,onde 3 vezes 2 resulta em 6
?sqrt(2) # sqrt significa raiz quadrada de valores entre parenteses, por exemplo 2 
?pi # significa valor de pi 
?log(x = 3,base = 10) # significa log de 3 na base 10
?exp(x = 1)  # função exponencial, onde x é o número ou vetor
sqrt(2)#1.414214
pi #3.141593
log(x = 3,base = 10) #0.4771213
exp(x = 1) # 2.718282

#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?
# o = é um atribuidor de valores a direita dos dados 
# o uso do parênteses para separar parte dos cálculos

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 
objeto1  #atribui o valor 3 ao nome objeto1
objeto = 42
objeto #atribui o valor 42 ao nome objeto1
objeto.2 <- 42
objeto.2 #atribui o valor 42 ao nome objeto.2

# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
# atribui a informacao ao lado direito para a nomeação a esquerda 
objeto.cubico <- objeto^3
resultado.1 <- (objeto.cubico / 3) + 7
objeto.cubico #74088
objeto.texto <- "texto sempre vem entre aspas"
objeto.texto #[1] "texto sempre vem entre aspas"
objeto.texto.2 <- "42"
objeto.texto.2 #42

objeto.vetor.1 = 1:34
objeto.vetor.1 # [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
# [32] 32 33 34
objeto.vetor2 = c(1, 74.5, 48)
objeto.vetor2 #[1]  1.0 74.5 48.0
?seq("vetor3", 20:32)
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5)
objeto.vetor3
# [1] 20.0 20.5 21.0 21.5 22.0 22.5 23.0 23.5 24.0 24.5 25.0 25.5 26.0 26.5 27.0 27.5 28.0 28.5
#[19] 29.0 29.5 30.0 30.5 31.0 31.5 32.0

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media #26
var(objeto.vetor3) #variancia #13.54167
median(objeto.vetor3) #mediana #13.54167
min(objeto.vetor3) #20
max(objeto.vetor3) #32
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

#diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor
#[1] 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5
#[24] 0.5

# R também faz comparações entre objetos
42 > 7 #true
?objeto == objeto.2 # objeto tem o valor de 42 e equivale o objeto 2 de mesmo valor
?objeto == objeto.texto.2 # ocorreu erro, pois o valor atribuido a objeto.texto 2 é o numero entre aspas, e somente texto é entre aspas
# o que aconteceu acima? 
7.1 <= 7.001 #false
?"<"

#pedindo ajuda
?pi 
?log
??lm
help(log)
help.search("anova")

#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho? 
# getwd()

# Como você lista o conteúdo do diretório de trabalho?
#dir(getwd())

# Como você define o diretório de trabalho?
#setwd()

# Como você carrega um arquivo de script?
#source()

# Como você salva os objetos que criou?
#save()

# Como você carrega os objetos que criou?
#load()

# Como ver quais objetos estão na sua área de trabalho?
# ls()

# Como remover objetos da área de trabalho?
#rm(list = ls())

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?
objetol #Error: object 'objetol' not found #o arquivo adicionado
ls(objetol)
objeto .texto #Error: unexpected symbol in "objeto .texto"
Objeto #Error: object 'Objeto' not found
source("chuchu.R") # cannot open file 'chuchu.R': No such file or directory
source(chuchu.R) #Error in source(chuchu.R) : object 'chuchu.R' not found #sem aspas
setwd("C:/CavernaDoDragão") #Error in setwd("C:/CavernaDoDragão") : cannot change working directory
getwd # function () .Internal(getwd()) <bytecode: 0x0000000011dae1f8>   <environment: namespace:base>
Getwd() #Error in Getwd() : could not find function "Getwd" #letra escrita em letra de forma
#dica: quando o R der erro, copie e cole a mensagem de erro no google