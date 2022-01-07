// Cálculo da média aritmética de n valores
// Entrada de dados


clear
a=x_dialog("Entre com o limite inferior da função",'-5')
b=x_dialog("Entre com o limite superior da função",'5')
// Converter de string para número
a=evstr(a)
b=evstr(b)

x=linspace(a,b,100)

f=x_dialog('Entre com a função','x.^3+3*x-5')
f=evstr(f)
plot2d(x,f)
xgrid
// ascii(10) = '\n'

// !Use x_choose!
met="fals_pos"//+ascii(10)+"fals_pos"+ascii(10)+"new-raph"+ascii(10)+"sec"
met=x_dialog("Entre com o método de resolução desejado",met)

if met=="bisec" | met=="fals_pos" then
    temp=x_mdialog("Entre com os valores a esrquerda e a direita da raíz:", ['xl' ; 'xu'], ['-5' ; '5'])
    xl=evstr(temp(1))
    xu=evstr(temp(2))
    clear temp // Liberar memória
    // preparação
    x = xu; fu = evstr(funcao);
    x = xl;
    fl = evstr(funcao);
    if (fu*fl >= 0) then
        error('Nenhuma raiz no intervalo dado');
    end
    i = 0; ea=100; xr_novo = xl;
    // se es nao foi estabelecido usa 0.0001%
    if argn(2) < 4 then
        es = 0.0001;
    end
    
    // inicio do processo iterativo
    printf("Iter\tErro aprox.%%\tRaiz\t\txl\t\txu\n");
    while ea > es do
        xr_velho = xr_novo; //-> aqui é aonde as diferenças entre os métodos começam
        if met=="bisec" then
            xr_novo=(xu+xl)/2
        end
    elseif met=="fals_pos" then
        x=xu ; numerador    = evstr(funcao)
        x=xl ; denominador  = evstr(funcao)-numerador
        numerador=numerador*(xl-xu)
        frac=numerador/denominador
        xr_novo = xu-frac;
    end //-> aqui é aonde as diferenças ente eles terminam
    
    if xr_novo ~=0 then // xr_novo não pode ser zero
        ea = abs((xr_novo - xr_velho)/xr_novo)*100;
    end
    i=i+1;
    printf("%d\t%f\t%f\t%f\t%f\n",i,ea,xr_novo,xl,xu);
    x=xr_novo;
    fr = evstr(funcao);
    x = xl;
    fl = evstr(funcao);
    if(fl*fr < 0) then
        xu = xr_novo;
    elseif(fl*fr > 0) then
        xl = xr_novo;
    else
    break;
    end
    end
    raiz = xr_novo;
end // Cálculo da raíz utilizando ou o métdo da falsa posição ou o métdo da bisecção já foi feito

if met=="new-raph" | met="sec" then
    
end
/*
// gerando saída
imprime(1) = msprintf('A raíz da função entrada vale:') // gerando string
for k=2:fun+1
    imprime(k) = msprintf(' %s, ',rep(k-1)) // gerando string
end
imprime(fun+2) = msprintf('vale = %.2f!',x) // gerando string
disp(imprime)
f=figure("Tag", "figura")
f.axes_size = [400 300]
// dimensão h x v da janela
f.figure_name = "Cálculo da média aritmética"
// título da janela
f.backgroundcolor = [0.94 0.94 0.94] // cor de fundo (cinza claro)
// Removendo os menus padrões de Scilab
delmenu(f.figure_id,gettext("&File"));
delmenu(f.figure_id,gettext("&Tools"));
delmenu(f.figure_id,gettext("&Edit"));
delmenu(f.figure_id,gettext("&?"));
// Desabilitando as ferraments gráficas
toolbar(f.figure_id,"off");
// Novo menu
a_menu = uimenu("Parent", f, "label", gettext("Aplicativo"));
h1 = uimenu("parent",a_menu,"label",gettext("Sair"),"callback","close_j();")
h2 = uimenu("parent",f,"label",gettext("About"));
// Preenchendo o menu about
uimenu("parent",h2, "label",gettext("About"),"callback","TRT_Sobre();");
*/
/* criando um objeto h de interface gráfica com o usuário (GUI)na janela f com
"estilo" "texto" onde será visualizada a "string" imprime,
na "posição" 20 horizontal (a partir da esquerda),
começando na 300 vertical (a partir do fundo)
com espaço reservado de largura 200 x altura 20,
"cor de fundo" cinza claro e "tamanho da fonte" 12. */
/*
for k=1:num+2
    h = uicontrol(f,"style","text","string",string(imprime(k)),"position",...
    [20,300-20*k,200,20],"BackgroundColor", [0.94 0.94 0.94],"fontsize",12)
end

function TRT_Sobre()
    msg = msprintf(gettext("Prof. Marco Valério M. Villaça\n "));
    messagebox(msg, gettext("About"), "info", "modal");
endfunction
*/
