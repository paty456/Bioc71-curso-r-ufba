#### aula 5#####

somas = apply(numericos, MARGIN = 2, FUN =  sum, na.rm=T) #aplique a funcao tal, com margem = ??? e utilize a funcao, no caso soma sem parenteses. Aplica funcao soma as todas as colunas, funcao logaritima como log, tb pode ser usado

lista.somas = lapply(numericos, FUN =  sum, na.rm=T) #apply n precisa ter formas iguais, pd se utilizado numerico, alfabetico, permite a funcao sendo aplicada diretamente na lista / lista eh colecao de objetos podendo ser data frame ou n, e dataframe eh uma colecao de vetores, no entanto, so pode vetores iguais = numericos com numericos
lista.somas

## $dragoes_completo.peso
## [1] 10377.68
## 
## $dragoes_completo.n_chifres
## [1] 560
## 
## $dragoes_completo.tamanho_asa
## [1] 890.0223
## 
## $dragoes_completo.idade
## [1] 9069.259

#lista a soma de cada coluna 

#Função sapply() Aplica uma função a cada elemento de uma lista, e retorna uma VETOR com os resultados 

#Função tapply() tapply(X, INDEX, FUN, ...) #semelhante ao agregatte so que este retorna um datafrme e no caso do tapply retorna uma matriz

#unique(dragoes_completo$cor)   tira erro de digitacao
dragoes_limpo = dragoes_completo #copie seus dados para um outro objeto, as substituicoes ocorrem aqui
#tolower altera tudo para a letra minuscula , como alterou o texto do fator deixa de ser fator , logo a parte de embaixo resolve isso

dragoes_limpo$cor = factor(dragoes_limpo$cor)#transformando novamente em fator

dragoes_limpo = dragoes_limpo[!is.na(dragoes_limpo$peso),]  #retira os is.na

unique(dragoes_limpo$cor)
## [1] branco   verde    preto    vermelho azul     dourado 
## Levels: azul branco dourado preto verde vermelho  #linha levels indica q eh um fator


#summary n mostra desvio padrao

sds = lapply(X = dragoes_limpo,FUN = sd ,na.rm=T ) #sd não funciona para fatores, n retorna nda

#erro.padrao.media = function(x) criacao de funcao
}
erros = aggregate(dragoes_limpo$idade #agrege objeto tal para a dieta para o erro padrao 
                  ,by=list(dragoes_limpo$dieta) #by eh para a regiao especifica dragoes limpo e dieta
                  ,FUN = erro.padrao.media  #associando a funcao erro
                  
dotchart(dragoes_limpo$tamanho_asa)  # indica os outliners

#q-q eh um teste t visual, n eh normal pois os pontos n cairam na reta








