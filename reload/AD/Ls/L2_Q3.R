# Equações
# a + b = 14
# (b - a)^2 = 36

# Como b > a:
# b - a = 6

# Sistema:
# a + b = 14
# b - a = 6

sistema <- matrix(c(1, 1,
                    -1, 1), nrow=2, byrow=TRUE)

resultado <- solve(sistema, c(14, 6))

a <- resultado[1]
b <- resultado[2]

print(a)
print(b)