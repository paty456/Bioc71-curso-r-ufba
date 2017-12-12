
conj1 = rnorm(10,mean=6,sd=3)
conj2 = rnorm(10,mean=7.5,sd=3.2)

source("simula.r")

simula(conj1,conj2,nsim=1000, teste="bi")
sim.dif=simula(conj1,conj2,nsim=1000, teste="bi")
sim.dif

simula(conj2,conj1,nsim=1000, teste="uni")
sim.maior =simula(conj2,conj1,nsim=1000, teste="uni")
sim.maior
sim.maior=simula(conj2,conj1,teste="uni")

t.dif =t.test(conj1,conj2, alternative="two.sided")
t.dif
t.maior =t.test(conj2,conj1, alternative= "greater")
t.maior
