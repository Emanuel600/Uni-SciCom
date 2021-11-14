function x=gaussi(A, b)
    // Eliminação de Gauss Ingênua
    // onde x vetor solução
    //  A é a matriz de coeficientes
    //  b é o vetor de termos constantes
    // exec('path\gaussi.sci',-1)
    // x=gaussi(A, b)
    [m,n] = size(A);
    if m~=n then
        error('A deve ser uma matriz quadrada.');
    end
    n=length(b)
    if m~=n then
        error('Dimensão incorreta de b');
    end
    nb = n + 1;
    A = [A b]; // obtendo a matriz aumentada
    // eliminação progressiva
    for i = 1:n-1
        for j = i+1:n
            A(j,i) = A(j,i)/A(i,i);
            // for k = i+1:nb
            //
            //A(j,k)= A(j,k)-A(j,i)*A(i,k);
            // end
            A(j,i+1:nb)= A(j,i+1:nb)-A(j,i)*A(i,i+1:nb);
            disp(A)
        end
    end
    // substituição regressiva
    x = zeros(n,1);
    x(n)= A(n,nb)/A(n,n);
    for i=n-1:-1:1
        // for j=i+1:n
        // x(i) = x(i) + A(i,j) * x(j);
        // end
        // x(i) = (A(i,nb)-x(i)) /A(i,i);
        // para resolver a equação em uma única linha
        // usa-se um for implícito para o somatório
        x(i) = (A(i,nb) - A(i,(i+1):n) * x((i+1):n)) /A(i,i);
    end
endfunction
