function ye=Interpolar()
    ye=0
    inter_err=x_mdialog("Entre com os vetores x e y, e o valor que deve ser interpolado (xe):", ['x';'y';'xe'], ['';'';''])
    // Converter de string para número
    x=evstr(inter_err(1))
    y=evstr(inter_err(2))
    xe=evstr(inter_err(3))
    
    n = length(x);
    while n ~= length(y) then
        inter_err(1:2) = x_mdialog("vetores x e y com dimenções diferentes, entre com outros valores", ['x';'y'], [inter_err(1);inter_err(2)]);
        x=evstr(inter_err(1))
        y=evstr(inter_err(2))
    end
    
    escolhas = ["Polinomial" ; "Newton" ; "Lagrange" ; "Splines"]
    met=x_choose(escolhas, "Escolha o método de interpolação desejado", "Cancelar")
    
    if met==0 then // Caso 'Cancelar' seja escolhido
        error("Programa interrompido")
    end
    
    select met
    case 1
        A=ones(n,n)
        f=ones(n,1)
        for i=1:n
            for j=2:n
                A(i,j)=x(i)^(j-1)
            end
            f(i)=y(i)
        end
        p=A\f
        for i=1:n
            ye=ye+p(i)*xe^(i-1)
        end
    case 2
        k = 0
        l = n
        A(:,1) = x'
        A(:,2) = y'
        for j=3:n+1
            for i=l:-1:2
                A(i-1,j) = (A(i,j-1)-A(i-1,j-1))/(A(i+k,1)-A(i-1,1))
                disp(A)
            end
            k = k+1
            l = l-1
        end
        xt = 1
        ye=A(1,2)
        for j = 1:n-1
            xt=xt*(xe-x(j))
            ye = ye+A(1,j+2)*xt
        end
    case 3
        soma = 0;
        for i = 1 : n
            produto = y(i);
            for j=1:n
              if i~=j
                    produto = produto*(xe-x(j))/(x(i)-x(j));
              end
            end
            soma = soma + produto;
        end
        ye = soma;
    case 4
        while xe>x(n) | xe<x(1)
            xe=x_mdialog("Valor xe escolhido não se encontra em nenhum intervalo, escolha outro valor.", 'xe', '')
            xe=evstr(xe)
        end
        for i=1:n
            while xe==x(i)
                xe=x_mdialog("Valor xe escolhido não pode ser um valor em x, escolha um valor dentro de um intervalo.", 'xe', '')
                xe=evstr(xe)
            end
        end
        // cálculo das diferenças finitas
        for i = 1:n-1
            h(i) = x(i+1)-x(i);
            ddf(i) = (y(i+1)-y(i))/h(i);
        end
        
        met=x_choose(["Natural", "Clamped", "Not-A-Knot"], "Escolha o tipo de spline a ser implementada:", "Cancelar")
        if met==0 then
            error("Operação interrompida")
        end
        
        if (met==2 | met==3) then
            A = zeros(n, n); // Monta A
            f = zeros(n, 1); // Monta f
            o = 1; // Utilizado para facilitar a formação da matriz depois
            select met
            case 2
               deri=x_mdialog("Entre com as derivadas nos pontos inicial e final", ["Inicial";"Final"])
               deri=evstr(deri)
               A(1,1:2)=[2*h(1) h(1)]
               A(n,(n-1):n)=[h(n-1) 2*h(n-1)]
               
               f(1,1)=3*(ddf(1)-deri(1))
               f(n,1)=3*(deri(1)-ddf(n-1))
           case 3
               A(1,1:3)=[h(2) -(h(1)+h(2)) h(1)]
               A(n,(n-2):n)=[h(n-1) -(h(n-2)+h(n-1)) h(n-2)]
           end
       elseif(met==1) then
            A = zeros(n-2, n-2); //monta A
            f = zeros(n-2,1); //monta f
            o = 0;
        end
        //Gerar a matriz A e o vetor coluna f
        for i = 1:n-2
            for j = 1:n-2+o
                if i == j then
                    A(i+o,j+o) = 2*(h(i)+h(i+1));
                elseif j == i+1 then
                    A(i+o,j+o) = h(j);
                elseif i == j+1 then
                    A(i+o,j+o) = h(i);
                end
            end
            f(i+o) = 3*(ddf(i+1)-ddf(i));
        end
        c = zeros (n, 1);
        if met==1 then
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
    end
    // gerando saída
    imprime = msprintf('O valor interpolado em x= %g é %g%c', xe, ye, ';') // gerando string
    disp(imprime)
    f=figure("Tag", "figura")
    f.axes_size = [600 200] // Isto parece apropriado para duas linhas de texto que podem ficar relativamente longas
    // dimensão h x v da janela
    f.figure_name = "Interpolação de um valor dados x e y"
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
    na "posição" 10 horizontal (a partir da esquerda),
    começando na 200 vertical (a partir do fundo)
    com espaço reservado de largura 600 x altura 20,
    "cor de fundo" cinza claro e "tamanho da fonte" 12. */
    h = uicontrol(f,"style","text","string",string(imprime),"position",...
    [10,200-20,600,20],"BackgroundColor", [0.94 0.94 0.94],"fontsize",12)
    
    function TRT_Sobre()
        msg = msprintf(gettext("Prof. Marco Valério M. Villaça\nEmanuel S. Araldi"));
        messagebox(msg, gettext("About"), "info", "modal");
    endfunction
    
    function close_j()
        close()
    endfunction
endfunction
