import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import poisson

# 5)

# a)
lambda_per_minute = 4

k_values = np.arange(0, 20)
pmf_values = poisson.pmf(k_values, lambda_per_minute)
cdf_vals = poisson.cdf(k_values, lambda_per_minute)

plt.figure(figsize=(14, 6))

plt.subplot(1, 2, 1)
plt.bar(k_values, pmf_values, color='skyblue')
plt.title('Função de Probabilidade\nPacotes Perdidos em 1 Minuto (λ=4)')
plt.xlabel('Número de pacotes perdidos')
plt.ylabel('P(X = k)')
plt.grid(True, axis='y', linestyle='--', alpha=0.7)

plt.subplot(1, 2, 2)
plt.step(k_values, cdf_vals, where='mid', color='orange')
plt.title('Função Acumulada de Probabilidade (CDF)\nPacotes Perdidos em 5 Minutos (λ=15)')
plt.xlabel('Número de pacotes perdidos')
plt.ylabel('P(X ≤ k)')
plt.grid(True, axis='both', linestyle='--', alpha=0.7)

plt.tight_layout()
plt.show()

# b) P(X = 6)
lambda_2min = lambda_per_minute * 2  # λ = 8
prob_6 = poisson.pmf(6, lambda_2min)
print(f"Probabilidade de exatamente 6 pacotes perdidos: {prob_6:.4f}")

# c) P(X ≤ 3)
prob_leq_3 = poisson.cdf(3, lambda_2min)
print(f"Probabilidade de no máximo 3 pacotes perdidos: {prob_leq_3:.4f}")

# d) Valor esperado em 5 minutos (é a própria taxa)
lambda_5min = lambda_per_minute * 5  # λ = 20

k_values = np.arange(0, 100)
pmf_values = poisson.pmf(k_values, lambda_5min)

expected_5min = 0
for i in range(len(k_values)):
    expected_5min = expected_5min + k_values[i] * pmf_values[i]

print(f"Esperança de pacotes perdidos em 5 minutos: {expected_5min}")

# d) Variância em 5 minutos (é a própria taxa)
expected2_5min = 0
for i in range(len(k_values)):
    expected2_5min = expected2_5min + (k_values[i] * k_values[i]) * pmf_values[i]

var_5min = expected2_5min - expected_5min**2

print(f"Variância de pacotes perdidos em 5 minutos: {var_5min}")
