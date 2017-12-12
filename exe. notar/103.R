d = c(rep('A',3),rep('B',3),rep('C',3))
dieta = rep(d,2)

pelagem = c(rep('claro',9),rep('escuro',9))

pesos = c(0.1, 1.1, 3.7, 5.7, -1.2, -1.5, 3.0, -0.4, 0.6, 1.5, -0.1, 2.0, 0.6, -3.0, -0.3,-0.2, 0.3, 1.5)

hamsters = data.frame("dieta"=dieta, "cor"=pelagem, "pesos"=pesos)

hamsters        

#### 103.2.2 sintetizando dados ####
media_pesos= mean(hamsters$pesos)
#A funcao recebe  como argumentos obrigatorios a variavelnumerica, categorica a funcao a ser aplicada
#edia.por.cor contendo a média dos pesos para cada cor de hamster (use a função tapply).

tapply(X=hamsters$pesos,INDEX =  hamsters$cor, FUN=mean)
media.por.cor = tapply(X=hamsters$pesos,INDEX =  hamsters$cor, FUN=mean)

#Crie um objeto chamado media.por.dieta contendo a média dos pesos para cada dieta dos hamsters.

tapply(X=hamsters$pesos, INDEX = hamsters$dieta, FUN=mean)
media.por.dieta = tapply(X=hamsters$pesos, INDEX = hamsters$dieta, FUN=mean)

#Crie um objeto chamado media.cruzada contendo a média dos pesos para cada categoria de cor e dieta. Ou seja, seu objeto deve conter o valor médio dos pesos para os hamsters claros de dieta A, escuros de dieta A, claros de dieta B etc.

media.cruzada = aggregate(hamsters$pesos, list(Region = hamsters$cor, hamsters$dieta), mean)
####https://analisereal.com/2015/05/31/dividir-aplicar-e-combinar-split-apply-and-combine-2/ ### 