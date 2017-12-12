sq1=0:100 
sq1= seq(0, 100, length.out = 15) #sequencia de 15 em intervalos de 0 a 100
sq1[c(5,10)] #listagem dos 5 e 10 valor
sq1[-c(5,10)] # exceto o quinto e décimo valores
sq2=sq1[-c(5,10)] #nomeie objeto dois
sq2 

sq3 #apenas as posições ímpares do objeto sq1; 
impar = sq1[seq(1,length (sq1),2)]  #numero 1,inicio de impar mais a sequencia do comprimento de sq1, de dois em dois
sq3=impar

sq3=sq1[c(1,3,5,7,9,11,13,15)] #esse eh o correto

sq4=sq1 #substituindo, apenas os valores nas posições pares, pelo número relativo à sua posição
n=length(sq4)
n # comprimento de sq4
pares=seq(2,n,2) #listagem dos numeros pares, iniciando por 2, o n indica o final q n se sabe, e dois por 2 em 2, e nomeando por pares
sq4[pares]=pares #sq4 eh a sequencia dos valores a partir do sq1 (15), [ ]indexa a funcao PARES acima, nomeando apos = por pares
