function x=cholesky(A, b) // Pode verificar simetria verificando soma de A==A'
    // Fatoração de Cholesky
    // function x = cholesly(A, b)
    // onde x vetor solução
    // A é a matriz de coeficientes
    // b é vetor de termos independentes
    soma = 0;
    [m,n] = size(A);
    if m~=n then
        error('A deve ser uma matriz quadrada');
    end
    m = length(b);
    if m~=n then
        error('Vetor b com número incorreto de linhas.');
    end
    if sum(A==A')~=m*n then //A~=A' não funciona por algum motivo
        // Todos os elementos são iguais a 1 se, e somente se, A for simétrica
        error("A deve ser simétrica")
    end
    main=diag(A) // Pega diagonal principal (DP) de A
    mini=min(main) // Pega menor valor da DP
    maxi=max(main) // Pega maior valor da DP
    if maxi*mini<0 then // Sinais opostos
        error('Matriz não é positiva definida')
    end
    for i=1:n
        if (2*main(i)<=sum(A(i,:))) then
            error("matriz não é positiva definida")
        end
    end
    //Obtenção da Matriz U Fatoração de Choles
    for i = 1:n
        for j = i:n
            if i == j then
                for k=1:(i-1)
                    soma = soma + A(k,i)^2;
                end
                A(i,i)= sqrt(A(i,i)- soma);
                soma = 0;
                else
                    for k=1:(i-1)
                        soma = soma + A(k,i)*A(k,j);
                    end
                A(i,j)= (A(i,j)-soma)/A(i,i);
                soma = 0;
            end
        end
    end
    disp('U',A);
    // substituição progressiva
    for i = 1:n
        for k=1:(i-1)
            soma = soma + A(k,i)*x(k);
        end
        x(i)= (b(i)-soma)/A(i,i);
        soma = 0;
    end
    disp('d',x);
    // substituição regressiva
    x(n)= x(n)/A(n,n);
    for i=n-1:-1:1
        x(i)=(x(i)-A(i,(i+1):n)*x((i+1):n))/A(i,i);
    end
endfunction
