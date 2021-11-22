// Função dada pelo professor
function x=fatoralu(A, b)
    // Fatoração LU
    // function x = fatorlu(A, b)
    // onde x vetor solução
    // A é a matriz de coeficientes
    // b é o vetor de termos constantes
    //
    [m,n] = size(A);
    if m~=n then
        error('A deve ser uma matriz quadrada');
    end
    P = eye(n,n);
    // eliminação progressiva
    for i = 1:n-1
        [maior, k]= max(abs(A(i:n,i)));
        l = i + k - 1;
        if l~=i then
            A([l,i],:)=A([i,l],:);
            P([l,i],:)=P([i,l],:);
        end
        for j = i+1:n
            A(j,i) = A(j,i)/A(i,i)
            A(j,i+1:n)= A(j,i+1:n)-A(j,i)*A(i,i+1:n);
        end
    end
    // substituição progressiva
    b = P*b;
    d = zeros(n,1);
    d(1)=b(1);
    for i = 2:n
        for j = 1:i-1
            d(i)= d(i) + A(i,j)*d(j);
        end
        //d(i)= b(i)-(A(i,1:(i-1))*d(1:(i-1)));
        d(i) = b(i) - d(i);
    end
    // substituição regressiva
    x = zeros(n,1);
    x(n)= d(n)/A(n,n);
    for i=n-1:-1:1
        x(i)=(d(i)-A(i,(i+1):n)*x((i+1):n))/A(i,i);
    end
endfunction
