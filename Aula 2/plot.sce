// Definir constantes
g=9.80665 ; m=60 ; c=0.25
// Criar função
function f = difer(t)
    f=sqrt(g*m/c)*tanh(sqrt(g*c/m)*t)
endfunction
// Criar espaço R²
pontos_x=linspace(0, 12, 24)
pontos_y=difer(pontos_x)
// Plotar
plot(pontos_x, pontos_y)
