% -----------------  Método de Powell -------------------------------------
% UNIVERSIDADE FEDERAL DE CATALÃO - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

function [xotimo]= Spowel(a,b,nbIteracoes,nbdirecoes,x,tol,H)

disp('------------------------Método de Powell--------------------------');
fprintf('\n');
disp('--------------------Histórico das Iterações---------------------');
k=0;
Y = x;%xinicial fica armazenado em Y para ser usado posteriormente
%Só para imprimir os valores de k, alfa, s, x e f(x) antes de qualquer
%iteração do método.
k = 0;
s = -gradiente(x);%direção de máxima descida
alfa = 0;
% disp('       k        alfa    s1 =x-y    s2 =x-y      x1        x2       f(x)   ');
% disp([k  alfa s' x(1) x(2)  fo(x)]);
for k = 1:nbIteracoes
    for q = 1:nbdirecoes
        s = H(:,q); %s, que representa a direção de busca, recebe o que há na coluna q da matriz H.
        alfa = Saurealfa(a,b,x,s,tol);%encontra o alfa ótimo por meio do método da seção áurea.
        x = x + alfa*s;%atualiza o vetor de variáveis projeto
    end
    val1f= fo(x);
    s = x - Y;
    alfa = Saurealfa(a,b,x,s,tol);%encontra o alfa ótimo por meio do método da seção áurea.
    x = x+ alfa*s;
    val2f=fo(x);
    
    fprintf(1,' ===================================================================================================================\n');
    fprintf(1,'   Iteração: %d\n',k);
    fprintf(1,'   alfa: %.3f, x1: %.2f, x2: %.3f, s1: %.3f, s2: %.3f, f(x1,x2): %.3f\n',alfa,x(1),x(2),s(1),s(2),fo(x));
    fprintf(1,' ===================================================================================================================\n');
    
    %Critério de parada: Quando a diferença entre o valor da FObj na iteração atual e na iteração anterior for menor que a tolerância.
    if abs(val2f -val1f)<tol
        
        plot (x(1),x(2),'xk');
        
        fprintf(1,' ================================================Solução encontrada pelo método de Powell===================================================================\n');
        fprintf(1,'   Iteração: %d\n',k);
        fprintf(1,'   alfa: %.3f, x1: %.2f, x2: %.3f, s1: %.3f, s2: %.3f, f(x1,x2): %.3f\n',alfa,x(1),x(2),s(1),s(2),fo(x));
        fprintf(1,' ===================================================================================================================\n');
        
        break
    end
    H(:,1) = [];%A primeira coluna da matriz H fica vazia;
    H= [H s];%A matriz H sem a primeira linha recebe s = x -Y como coluna, ou
    %seja, H recebe a direção de busca s = x -Y; Essa nova matriz será usa-
    %da na próxima iteração k do método.
end
if k == nbIteracoes
    disp('------------------------------------------------------------------');
    fprintf('O número máximo de iterações escolhido foi atingindo e o método não convergiu \n para a solução ótima.');
    fprintf('\n');
    lastsol = [x fo(x)];
    fprintf('Última solução encontrada:');
    fprintf('\n');
    disp('       x1       x2    f(x)');
    disp(lastsol);
end

%plot das curvas de nivel
[X1,X2]=meshgrid(a:0.1:b,a:0.1:b);

hold on;
contour(X1,X2,real(focontour(X1,X2)),50);

ylabel({'X2'});
xlabel({'X1'}); 

end

