custom_sample <- function(x, size, replace = FALSE, prob = NULL)
{
  # Se x for um número único positivo, usa 1:x
  if (length(x) == 1 && is.numeric(x) && x >= 1)
  {
    x <- 1:x
  }
  
  n <- length(x)
  
  # Verificações básicas
  if (!replace && size > n)
  {
    stop("Não é possível tirar uma amostra maior que o vetor sem reposição.")
  }
  
  if (!is.null(prob))
  {
    if (length(prob) != n)
    {
      stop("O vetor de probabilidades deve ter o mesmo tamanho de x.")
    }
    
    if (any(prob < 0))
    {
      stop("As probabilidades não podem ser negativas.")
    }
    
    if (sum(prob) == 0)
    {
      stop("A soma das probabilidades deve ser maior que zero.")
    }
    
    prob <- prob / sum(prob)    #normaliza
  }
  
  resultado <- vector(mode = mode(x), length = size)
  
  for (i in 1:size)
  {
    if (is.null(prob))
    {
      idx <- floor(runif(1, 1, length(x) +1))
    }
    else
    {
      u <- runif(1)
      acumulada <- cumsum(prob)
      idx <- which(u <= acumulada)[1]
    }
    
    resultado[i] <- x[idx]
    
    if (!replace)
    {
      x <- x[-idx]
      
      if (!is.null(prob))
      {
        prob <- prob[-idx]
        prob <- prob / sum(prob)
      }
    }
  }
  
  return (resultado)
}

# 

set.seed(123)

custom_sample(1:10, 5)      # amostra de 5 elementos sem reposição

custom_sample(10, 4)        # equivalente a sample(1:10, 4)

custom_sample(c("a","b","c"), 5, replace = TRUE)    # com reposição

custom_sample(c("a","b","c"), 5, replace = TRUE, prob = c(0.1, 0.2, 0.7))    # com probabilidades

      