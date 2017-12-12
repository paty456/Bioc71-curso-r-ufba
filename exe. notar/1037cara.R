####cara ou coroa
moeda = c("cara", "coroa")

moedaamostra = sample(sample(moeda, 1000, replace = TRUE, prob = NULL)) 
(contagem = table(moedaamostra)) 


moedaamostra2 = sample(sample(moeda, 50, replace = TRUE, prob = NULL))
(contagem2 =table(moedaamostra2))

moedaamostra3= sample(sample(moeda, 100000, replace = TRUE, prob = NULL))
(contagem3 =table(moedaamostra3))

(porcentagem= 503/1000*100)

(porcentagem2= 19/50*100)

(porcentagem3= 50043/100000*100)

porisso=100000
