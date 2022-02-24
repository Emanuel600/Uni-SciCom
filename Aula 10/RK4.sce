function [y, t]=rk4(fun, ti, tf, h, y0)
    // Res. de sist. EDs por RK4
    // function [y,t]=rk4(fun,ti,tf,h,y0)
    // onde y é o vetor solução para a variavel depentente
    // t é o vetor da variável independente
    // ti é o instante inicial
    // tf é o instante final
    // h é o tamanho do pass
    // y0 valor inicial da variável dependente
    // Exemplo de chamada:
    // exec('path\rk4.sci',-1)
    // fun = '[ya(2),9.81-(0.25/68.1)*ya(2)^2]'
    // [y,t]=rk4(fun,ti,tf,h,y0)
    //
    t(1) = ti; y(1,:)=y0; i =1;ta=ti
    // inicio do processo iterativo
    while ta < tf do
        ya = y(i,:);
        k1 = evstr(fun);
        ya=y(i,:)+k1*h/2;
        ta = ta + h/2;
        k2 = evstr(fun);
        ya=y(i,:)+k2*h/2;
        k3 = evstr(fun);
        ya=y(i,:)+k3*h;
        ta = ta + h/2;
        k4 = evstr(fun);
        phi = (k1+2*(k2+k3)+k4)/6;
        y(i+1,:)=y(i,:)+phi*h;
        t(i+1)=ta;
        i=i+1;
    end
endfunction
