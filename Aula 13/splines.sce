// Script alterado a partir do enviado pelo professor
function ye=splines(x, y, xe, tipo, vetor)
    /* onde o y(a), b, c, d são vetores com coeficientes das (n-1)
    cubicas naturais
    ye é o valor da variável dependente em xe
    x é o vetor dos pontos amostrados da variável independente
    y é o vetor dos pontos amostrados da variável dependente */
    n = length(x);
    if n ~= length(y) then
        error("vetores x e y com dimenções diferentes");
    end
    // cálculo das diferenças finitas
    for i = 1:n-1
        h(i) = x(i+1)-x(i);
        ddf(i) = (y(i+1)-y(i))/h(i);
    end
    if (tipo=='c' | tipo=='k') then
        A = zeros(n, n); // Monta A
        f = zeros(n, 1); // Monta f
        o = 1; // Utilizado para facilitar a formação da matriz depois
        select tipo
        case 'c'
           A(1,1:2)=[2*h(1) h(1)]
           A(n,(n-1):n)=[h(n-1) 2*h(n-1)]
           
           f(1,1)=3*(ddf(1)-vetor(1))
           f(n,1)=3*(vetor(1)-ddf(n-1))
       case 'k'
           A(1,1:3)=[h(2) -(h(1)+h(2)) h(1)]
           A(n,(n-2):n)=[h(n-1) -(h(n-2)+h(n-1)) h(n-2)]
       end
   elseif(tipo=='n') then
        A = zeros(n-2, n-2); //monta A
        f = zeros(n-2,1); //monta f
        o = 0;
    else
    error(msprintf("Operação %c não é suportada", tipo))
    end
    //Gerar a matriz A e o vetor coluna f
    for i = 1:n-2
        for j = 1:n-2+o
            if i == j then
                A(i+o,j) = 2*(h(i)+h(i+1));
            elseif j == i+1 then
                A(i+o,j) = h(j);
            elseif i == j+1 then
                A(i+o,j) = h(i);
            end
        end
        f(i+o) = 3*(ddf(i+1)-ddf(i));
    end
    c = zeros (n, 1);
    if tipo=='n' then
        c(2:n-1,1) = A\f;
    else
        c=A\f
    end
    for i=1:n-1
        d(i) = (c(i+1)-c(i))/(3*h(i));
        b(i) = ddf(i)- (h(i)/3)*(2*c(i)+c(i+1));
        //descobrindo em qual segmento está o ponto a ser
        // interpolado
        if (xe > x(i)) & (xe < x(i+1)) then
            j = i;
        end
    end
    k = xe - x(j);
    ye = y(j) + b(j)*k + c(j)*k^2 + d(j)*k^3;
    //construindo as splines
    for j=1:n-1
        xx = linspace(x(j), x(j+1), 1000);
        k = xx-x(j);
        yy = y(j) + b(j)*k + c(j)*k .^2 + d(j)*k .^3;
        plot2d(xx, yy);
    end
    plot(x, y, 'ro')
    ylabel("Splines");
    xlabel("x");
    xgrid;
endfunction
