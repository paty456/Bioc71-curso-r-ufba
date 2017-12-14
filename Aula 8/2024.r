Euc.altu = rnorm(n=1000, mean=23, sd=5)
pnorm(10, mean=23, sd=5, lower.tail = TRUE)
p10 = pnorm(10, mean=23, sd=5, lower.tail = TRUE)
p30 = pnorm(30, mean = 23, sd=5, lower.tail = FALSE)
p20 = pnorm(20, mean = 23, sd=5, lower.tail = FALSE)
p20a30 = p20-p30
maiores = qnorm(0.9, mean = 23, sd=5, lower.tail = TRUE)

