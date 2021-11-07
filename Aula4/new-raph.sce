// Função dada pelo professor
function [raiz, iter]=new_raphson(funcao, derivada, es, maxi)
    // Cálculo das raizes por Newton-Raphson
    // onde raiz é a raiz procurada de funcao
    // iter é o número de iterações realizadas para o erro especificado
    // funcao é a função de entrada literal em x
    // derivada é a derivada da função de entrada literal em x
    // es é o criterio de parada que é opcional
    // maxi é o numero maximo de iterações
    // A condição inicial x0 é escolhida com o auxilio de um grafico
    // Exemplo de chamada:
    //
    // fun = ‘log(x) + x‘
    // dxdt = ‘(1/x) + 1‘
    // [raiz,iter]=new_raphson(fun, dxdt, 0.0001,50)
    //
    // Construção do gráfico da função
    a = input("Entre com o limite inferior de x a = ");
    b = input("Entre com o limite superior de x b = ");
    x = linspace(a,b,100);
    f = evstr(funcao)
    plot2d(x,f);
    xgrid;
    // escolha do valor inicial
    x0 = input("Entre com o valor inicial x0 = ");
    i = 0; x = x0;
    // se es nao foi estabelecido usa 0.0001%
    if argn(2) < 3 then
        es = 0.0001;
    end
    // se maxi nao foi estabelecido usa 50
    if argn(2) < 4 then
        maxi = 50;
    end
    printf("Iter\tRaiz\terro aproximado %% \n");
    // inicio do processo iterativo
    while 1 do
        fxi = evstr(funcao);
        dxi = evstr(derivada);
        if dxi == 0
            error('Derivada igual a zero, o processo divergiu');
        end
        xi = x - (fxi/dxi);
        i= i+1;
        if xi ~=0 then // xi não pode ser zero
            ea = abs((xi - x)/xi)*100;
        end
        printf("%d\t%.10f\t%f\n",i,xi,ea);
        if ea < es | i >= maxi then
            break;
        end
        x = xi;
    end
    if i == maxi then
        raiz = 'divergiu';
    else
        raiz = xi;
        printf("\nf(%f) = %f\n",xi,fxi);
    end
    iter = i;
endfunction
