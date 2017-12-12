hoje <- Sys.Date() 

#Qual eh a classe deste objeto?
class(hoje)
  
#Qual a diferenca em dias entre esta data e o dia em que o Brasil foi tricampeão mundial1? Guarde esse valor em um objeto chamado dif.
copa.70 <- "21/06/70" #Mas o R tem uma classe para datas, que é Date.  
copa.70 <- as.Date(copa.70,format="%d/%m/%y")
hoje-copa.70
dif =(hoje-copa.70)
dif
#format da função as.Date informa o formato em que está o conjunto de caracteres que deve ser transformado em data, no caso dia/mês/ano (%d/%m/%y), todos com dois algarismos

#Qual será a data de daqui a 43 dias? Guarde esse valor em um objeto chamado outrodia.
hoje+43
outrodia =(hoje+43)
outrodia
