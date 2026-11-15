pMA = 0.8
pMB = 1 - 0.8  # 0.2

lambdaA = 1/90
lambdaB = 1/110

# (P X > 100) ?
# (P X > 100) = 1 - P(X <= 100)
#1 - pexp(100,rate = lambdaA)
#1 - pexp(100, rate = lambdaB)


pMA * (1 - pexp(100, lambdaA)) + pMB * (1 - pexp(100, lambdaB))
# 𝑃(𝐶) = 𝑃(𝐴)*𝑃(𝐶|𝐴) + 𝑃(𝐵)*𝑃(𝐶|𝐵) = 0,80*𝑃(𝑋𝐴>100) + 0,20*𝑃(𝑋𝐵 > 100)