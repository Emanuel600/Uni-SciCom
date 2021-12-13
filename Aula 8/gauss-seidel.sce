// Função dada pelo professor
function [x, iter]=gauss_seidel(A, b, lam, es, maxi)
    // onde x vetor solução
    // A é a matriz de coeficientes
    // b é o vetor de entrada
    // lam é o fator de relaxamento lambda, por default = 1
    // es é o critério de parada, por default = 0.0001%
    // maxi é o numero máximo de iterações, default = 50
    //
    if argn(2) < 3 then
        lam = 1;
    end
    if argn(2) < 4 then
        es = 0.0001;
    end
    if argn(2) < 5 then
        maxi = 50;
    end
    [m,n] = size(A);
    if m~=n then
        error('A deve ser uma matriz quadrada');
    end
    m = length(b);
    if m~=n then
        error('Vetor b com número incorreto de linhas.');
    end
    //C = A; d = b;
    // Obtém C, d e condições iniciais em zero
    for i = 1:n
        x(i) = 0;
        b(i) = b(i)/A(i,i);
        A(i,1:n)= A(i,1:n)/A(i,i);
        A(i,i)=0;
    end
    // obtenção da solução
    iter = 0;
    while(1)
        for i=1:n
            x_old = x(i)
            x(i)=lam*(b(i)- A(i,:)*x - x_old) + x_old;
            if x(i)~=0 then
                ea(i)= abs((x(i)-x_old)/x(i))*100;
            end
        end
        iter = iter + 1;
        scatter(iter, x(1))
        disp(x);
        disp(ea)
        if max(ea)<=es | iter >= maxi then
            break;
        end
    end
    if iter == maxi then
        x = 'Processo não convergiu';
    end
endfunction
