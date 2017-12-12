luz = c(9839, 10149, 10486, 10746, 11264, 11684, 12082, 12599, 13004, 13350, 13717, 14052)
luz.cons = diff(luz) #diff diferença de um valor ao seu próximo valor, ex: 
mean(luz)
median(luz)
var(luz)
luz.m = mean(luz.cons)
luz.md = median(luz.cons)
luz.v = var(luz.cons)
maximo = max(luz.cons)
minimo = min(luz.cons)
luz.range = c (maximo, minimo)
luz.cons
