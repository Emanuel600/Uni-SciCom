function ye=pi_Lagr(x, y, xe)
    /* onde
    ye é o valor interpolado da variável dependente;
    x é um vetor com os valores conhecidos de var. independente;
    y é um vetor com os valores conhecidos de var. dependente;
    xe é o valor da variável independente onde a interpolação é
    calculada */
    n = length (x);
    if length(y)~= n then
        error ("vetores com tamanho diferente");
    end
    soma = 0;
    for i = 1 : n
        produto = y(i);
        for j=1:n
          if i~=j
                produto = produto*(xe-x(j))/(x(i)-x(j));
          end
        end
        soma = soma + produto;
    end
    ye = soma;
endfunction
