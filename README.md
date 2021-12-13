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

# => Aula 3
  - Exercício 2: Utilizar o método da bisseção para **maualmente** estimar as raízes de f(x) = cos(x) -xe^x
    - Utilizar função scilab para confirmar resultado
  - Exercício 3: Utilizar função scilab para resolver problema apresentado nos slides

# => Aula 4
  - Exercício 1: Utilizar método Newton-Raphson e secante modificado para estimar raízes de f(x)=x³-10 em 0<=x<=4
    - Manualmente, com critério de parada |es|<1%
    - Com auxílio de funções scilab e critério de parada 1e-4%
  - Exercício 2: Calcular frequência w do circuito RLC, descrito no slide, para que tenha uma impedância de 100Ω com o método da secante modificado
  - Exercício 3: Encontrar ângulo inicial do lançamento, descrito no slide, para que um receptor a 90m de distância receba a bola a 1m de altura

# => Aula 5
  - Exercício 1: Utilizar eliminação de Gauss para resolver uma matriz e testar o efeito do pivotamento
  - Exercício 2: Utilizar eliminação de Gauss para resolver sistema de 3(?) equações
    - manualmente
    - função scilab

# => Aula 6
  - Exercício 1: Resolver manualmente exercício da p. 18 utilizando fatoração LU - Checar com scilab
  - Exercício 2: Resolver exercício da p. 22 utilizando a função de cholesky dada pelo professor
  - Exercício 3: Adicionar funcionalidade de detectar se a matriz entrada é simétrica positiva definida, e retornar erro caso não seja

# => Aula 7
  - Exercício 1: Calcular norma e condicionamento de uma matriz (manualmene e com Scilab)
  - Exercício 2: Calcular matriz inversa (com Scilab) e analisar o quanto a fonte indicada contribui para i2

# => Aula 8
  - Exercício 1: Resolver exercícios do PDF contendo a 8ª aula
  - Exercício 2: Modificar a função `gauss_seidel` para imprimir um gráfico de x1 em função do número de iterações

# => Aula 9
  - Exercício 1: Resolver o último exercício do PDF e apresentar o gráfico do sistema de equações
