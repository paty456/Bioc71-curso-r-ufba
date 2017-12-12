### lendo e salvando seus dados###

e.grandis = read.table('egrandis.csv', sep=';', as.is=F, header=TRUE) #Salve os dados em um objeto denominado e.grandis (usando as.is=F, onde sep = ",", # define o caractere que deve ser o separador de colunas, as.is=F

breviarium = summary(e.grandis) #Crie um objeto denominado breviarium contendo o summary das variáveis.a função retorna média, mediana, mínimo e máximo da variável x
cont1 = table(e.grandis$ano) #Crie um objeto denominado cont.1 contendo a tabela de contagem da variável "ano". (e.grandis=linha e ano = coluna)
cont2 = table(e.grandis$rotacao, e.grandis$regiao) #Crie um objeto denominado cont.2 contendo a tabela de contagem das variáveis "rotacao" e "regiao" juntas.
bofete = e.grandis[e.grandis$regiao=='Bofete',] # Selecione os dados da região "Bofete" (e.grandis$regiao=='Bofete',) e separe em um novo objeto denominado bofete. 

write.table(bofete,'bofete.txt',sep='\t', row.names=FALSE) #Salve-o em um arquivo denominado bofete.txt no diretório corrente, separado por tabulação e sem nome de linhas.

#write.csv(x= arquivoLido,     #objeto a ser gravado
          #file = "arquivoNovo.csv", #nome do arquivo que vai ser gerado
          #sep = ",", # define o caractere que deve ser o separador de colunas
          #dec = ".", #define o caractere que deve ser o spearador de decimal
         # row.names = F #ignora nomes/numeros das linhas
)
