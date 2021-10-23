# Uni-SciCon
Uni - Computação Científica

# => Aula 1:
- Exemplos:
  - 1: Calcular e^x
  - 2: Calcular cos(x)
    - 2.1: Calcular sqrt(x)
  - 3: Soma do inverso dos quadrados de 1 a x
    - 3.1 Do maior para o menor
    - 3.2 Do menor para o maior

# => Aula 2
## Primeira Parte
- Exercícios Parte 1
  - 1: Considere a função: sqrt(x²+1)-1
    - Reescrever racionalizando o numerador
    - Usando aritmética decimal de 5 dígitos com corte, calcular f(0.001) utilizando as funções normal e racionalizada
      - Refazer com aritmética de dupla(10) precisão
    - Utilizando aritmética de dupla precisão, calcule f(10^-6), utilizando as duas formas da função
    - Explique os resultados
  - 2: Codificar regra de Horner em C para avaliar f(x) = x³-6.1x²+3.2x+1.5 para x = 4.71
    - 3: Avaliar f(x) usando aritmética de 3 dígitos com arredondamento e corte e calcular os respectivos erros relativos
      - Reescrever o polinônimio empregando a regra de Horner, e avaliar usando aritmética de 3 dígitos com arredondamento e corte e calcular os respectivos erros relativos
      - Discutir os resultados

- Exercícios Parte 2
  - 1: Demonstar a solução analítica de dv/dt = g-(cd * v²/m)

## Segunda Parte
  Mostrar que a aproximação centrada de d³f/dx³ em x = xi; i = 3, 4, ..., n-2 é calculada por:
  
  f'''(xi) ≃ (( f(xi+2) - f(xi-2) - 2f(xi+1) + 2f(xi-1) ) / 2h³) + 0(h²)
