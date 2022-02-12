function [alfa, betha, r]=reglinear(x, y, e, m)
    /* x vetor com os pontos da variável independente
    y vetor com os pontos da variávei dependente
    e: 'r' - reta, 'e' - exp, 'p' - potencia, 's' - saturação
    se for s tem que passar a potencia m */
    a=[0 0];
    n = length(x)
    if n~=length(y) then
        error("inconsistencia nos dados");
    end
    plot(x,y,'o')
    xx = linspace(min(x),max(x),100);
    if (e == 'e') then
        y = log(y);
        elseif (e == 'p') then
            x = log10(x);
            y = log10(y);
        elseif (e == 's') then
            x = 1 ./ x .^m;
            y = 1 ./ y;
        elseif (e == 'r')
            // não necessita ajuste nos eixos
        else
            error("opção inexistente");
    end
    somax=sum(x); somay=sum(y); somaxy=sum(x.*y);
    somaxx=sum(x.^2); somayy=sum(y.^2);
    A = n*somaxy - somax*somay;
    B = n*somaxx - somax^2;
    C = n*somayy - somay^2;
    a(2) = A/B; // a1
    a(1) = somay/n - a(2)*somax/n; // a0
    r = (A/(sqrt(B)*sqrt(C)))^2;
    if (e == 'e') then
        betha = a(2);
        alfa = exp(a(1));
        yy =alfa*exp(betha*xx);
        elseif (e == 'p') then
            betha = a(2);
            alfa = 10^(a(1))
            yy = alfa*xx.^betha
        elseif (e == 's') then
            alfa = 1/a(1);
            betha = alfa*a(2);
            yy = alfa*xx.^m ./ (betha + xx.^m);
        elseif (e == 'r')
            yy = a(1)+a(2)*xx;
            alfa = a(1);
            betha = a(2);
    end
    plot(xx,yy)
    xgrid;
endfunction
