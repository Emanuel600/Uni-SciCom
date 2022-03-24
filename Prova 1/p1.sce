// Cálculo da média aritmética de n valores
// Entrada de dados
clear ; i=0
inter_err=x_mdialog("Entre com so limites inferior (a) e superior (b) e sua precisão desejada (es):", ['a';'b';'es'], ['1.2';'1.1';'1e-4'])
// Converter de string para número
a=evstr(inter_err(1))
b=evstr(inter_err(2))
es=evstr(inter_err(3))
ea=100 // Caso a raíz não seja calculada
x=linspace(a,b,100)

funcao=x_dialog('Entre com a função','x.^3+3*x-5')
y=evstr(funcao)
plot2d(x,y)
xgrid
clear y

escolhas = ["Método da bisecção" ; "Método da falsa posição" ; "Método de Newton-Raphson" ; "Método da secante"]
met=x_choose(escolhas, "Escolha o método de resolução desejado a partir do gráfico", "Cancelar")

if met==1 | met==2 then
    temp=x_mdialog("Entre com os valores a esrquerda e a direita da raíz:", ['xl' ; 'xu'], [inter_err(1) ; inter_err(2)])
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
    // inicio do processo iterativo
    printf("Iter\tErro aprox.%%\tRaiz\t\txl\t\txu\n");
    while ea > es do
        xr_velho = xr_novo; //-> aqui é aonde as diferenças entre os métodos começam
        if met==1 then
            xr_novo=(xu+xl)/2
        elseif met==2 then
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
    x = xr_novo ; fxi = evstr(funcao)
end // Cálculo da raíz utilizando ou o métdo da falsa posição ou o métdo da bisecção já foi feito

if met==3 | met==4 then
    select met
    case 3
        temp=x_mdialog("Entre com: Valor inicial(x0), Derivada(deri) e o número máximo de iterações(maxi) para f(x)="+funcao, ['x0';'deri';'maxi'],['0';' ';'50'])
    case 4
        temp=x_mdialog("Entre com: Valor inicial(x0), Perturbação em torno de x(dxi) e o número máximo de iterações(maxi)", ['x0';'dxi';'maxi'],['0';'1e-4';'50'])
        if temp(2)==0 then
            error("Perturbação tem que ser diferente de 0")
        end
    end
    x=evstr(temp(1))
    while 1 do
        xi=x // Caso o primeiro valor tenha f'(x)=0 e seja a raíz ou esteja próximo o suficiente desta
        maxi=evstr(temp(3))
        fxi=evstr(funcao) // <- Aqui terminam as similaridades
        select met
        case 3
            derivada=temp(2)
            dxi = evstr(derivada);
            if dxi == 0
                raiz='Derivada igual a zero, o processo divergiu com x='+string(xi)+', f(x)='+string(fxi);
                break
            end
            xi = x - (fxi/dxi);
        case 4
            dxi=evstr(temp(2))
            p = x*dxi // <- calcula a perturbação
            x = x + p; // <- soma a perturbação
            fdxi = evstr(funcao);
            x=x-p // <- desconta a perturbação
            xi = x - fxi*p/(fdxi-fxi);
        end
        i= i+1; // <- Aqui se resumem as similaridades
        if xi ~=0 then // xi não pode ser zero
            ea = abs((xi - x)/xi)*100;
        end
        printf("%d\t%.10f\t%f\n",i,xi,ea);
        if ea < es | i >= maxi then
            break;
        end
        x = xi;
    end
    if i == maxi then
        raiz = 'divergiu com x='+string(xi)+', f(x)='+string(fxi);
    else
        if ea<es then // Para caso f'(x)=0
            raiz = xi;
            printf("\nf(%f) = %f\n",xi,fxi);
        end
    end
end
iter=i
// gerando saída
try // Se funcionar, raiz foi encontrada
    imprime(1) = msprintf('A raíz da função entrada se encontra em x= %.16g%c', raiz, ';') // gerando string
catch // Se der erro, raiz não foi encontrada
    imprime(1) = msprintf(raiz) // gerando string
end

imprime(2) = msprintf('Com um erro aproximado de %.10g%%, sendo que foram necessárias %d iterações', ea, iter) // Limitando o espaço máximo ocupado
f=figure("Tag", "figura")
f.axes_size = [600 200] // Isto parece apropriado para duas linhas de texto que podem ficar relativamente longas
// dimensão h x v da janela
f.figure_name = "Cálculo da raíz da função entrada"
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
/* criando um objeto h de interface gráfica com o usuário (GUI)na janela f com
"estilo" "texto" onde será visualizada a "string" imprime,
na "posição" 20 horizontal (a partir da esquerda),
começando na 300 vertical (a partir do fundo)
com espaço reservado de largura 200 x altura 20,
"cor de fundo" cinza claro e "tamanho da fonte" 12. */
for k=1:2
    h = uicontrol(f,"style","text","string",string(imprime(k)),"position",...
    [10,200-20*k,600,20],"BackgroundColor", [0.94 0.94 0.94],"fontsize",12)
end

function TRT_Sobre()
    msg = msprintf(gettext("Prof. Marco Valério M. Villaça\nEmanuel S. Araldi"));
    messagebox(msg, gettext("About"), "info", "modal");
endfunction

function close_j()
    close()
endfunction

clear
