% -----------------  M�todo de Powell -------------------------------------
% UNIVERSIDADE FEDERAL DE CATAL�O - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

function [xotimo]= Spowel(a,b,nbIteracoes,nbdirecoes,x,tol,H)

disp('------------------------M�todo de Powell--------------------------');
fprintf('\n');
disp('--------------------Hist�rico das Itera��es---------------------');
k=0;
Y = x;%xinicial fica armazenado em Y para ser usado posteriormente
%S� para imprimir os valores de k, alfa, s, x e f(x) antes de qualquer
%itera��o do m�todo.
k = 0;
s = -gradiente(x);%dire��o de m�xima descida
alfa = 0;
% disp('       k        alfa    s1 =x-y    s2 =x-y      x1        x2       f(x)   ');
% disp([k  alfa s' x(1) x(2)  fo(x)]);
for k = 1:nbIteracoes
    for q = 1:nbdirecoes
        s = H(:,q); %s, que representa a dire��o de busca, recebe o que h� na coluna q da matriz H.
        alfa = Saurealfa(a,b,x,s,tol);%encontra o alfa �timo por meio do m�todo da se��o �urea.
        x = x + alfa*s;%atualiza o vetor de vari�veis projeto
    end
    val1f= fo(x);
    s = x - Y;
    alfa = Saurealfa(a,b,x,s,tol);%encontra o alfa �timo por meio do m�todo da se��o �urea.
    x = x+ alfa*s;
    val2f=fo(x);
    
    fprintf(1,' ===================================================================================================================\n');
    fprintf(1,'   Itera��o: %d\n',k);
    fprintf(1,'   alfa: %.3f, x1: %.2f, x2: %.3f, s1: %.3f, s2: %.3f, f(x1,x2): %.3f\n',alfa,x(1),x(2),s(1),s(2),fo(x));
    fprintf(1,' ===================================================================================================================\n');
    
    %Crit�rio de parada: Quando a diferen�a entre o valor da FObj na itera��o atual e na itera��o anterior for menor que a toler�ncia.
    if abs(val2f -val1f)<tol
        
        plot (x(1),x(2),'xk');
        
        fprintf(1,' ================================================Solu��o encontrada pelo m�todo de Powell===================================================================\n');
        fprintf(1,'   Itera��o: %d\n',k);
        fprintf(1,'   alfa: %.3f, x1: %.2f, x2: %.3f, s1: %.3f, s2: %.3f, f(x1,x2): %.3f\n',alfa,x(1),x(2),s(1),s(2),fo(x));
        fprintf(1,' ===================================================================================================================\n');
        
        break
    end
    H(:,1) = [];%A primeira coluna da matriz H fica vazia;
    H= [H s];%A matriz H sem a primeira linha recebe s = x -Y como coluna, ou
    %seja, H recebe a dire��o de busca s = x -Y; Essa nova matriz ser� usa-
    %da na pr�xima itera��o k do m�todo.
end
if k == nbIteracoes
    disp('------------------------------------------------------------------');
    fprintf('O n�mero m�ximo de itera��es escolhido foi atingindo e o m�todo n�o convergiu \n para a solu��o �tima.');
    fprintf('\n');
    lastsol = [x fo(x)];
    fprintf('�ltima solu��o encontrada:');
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

