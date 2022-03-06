function I=Simp38(a, b, fun, n)
    h=(b-a)/(3*n)
    x=a:h:b
    I=0
    
    fx=evstr(fun)
    
    for i=1:n
        I=I+fx(3*i-2)+3*fx(3*i-1)+3*fx(3*i)+fx(3*i+1)
    end
    
    I=I*(b-a)/(8*n)
endfunction
