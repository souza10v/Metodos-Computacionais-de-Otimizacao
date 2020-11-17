% -----------------------  Método Politopo ------------------------------
% UNIVERSIDADE FEDERAL DE CATALÃO - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% ------------------------------------------------------------------------
clear all;  %limpa variáveis
clc %limpa antigas execuções
syms x1 x2 X1 X2;


disp([' Método Busca Aleatória ']);

f1= @(X) X(1) - X(2) + 2.*X(1).^2 +2.*X(1).*X(2) +X(2).^2 %[ALTERAR] 
% f1= @(x)X(1).^2 - 3.*X(1).*X(2) + 4.*X(2)^2 + X(1) -X(2); EXEMPLO



a=-1; %[ALTERAR] CHUTE INICIAL X1
b=1; %[ALTERAR] CHUTE INICIAL X2
q=100; %[ALTERAR] ITERAÇÕES
k=1;

p1(k)=round(a+rand()*(b-a),4);
p2(k)=round(a+rand()*(b-a),4);
r=[p1(k);p2(k)];
F(k)=f1(r);

while k<=q
    
p1(k+1)=round(a+rand()*(b-a),4);
p2(k+1)=round(a+rand()*(b-a),4);
r=[p1(k+1);p2(k+1)];
F(k+1)=f1(r);

if (F(k+1)>F(k)) %se novo f maior que o antigo
    
    F(k+1)=F(k);
    p1(k+1)= p1(k);
    p2(k+1)= p2(k);
    disp([ num2str(k) ': '  num2str(p1(k+1)) ' '  num2str(p2(k+1)) '  '  num2str(F(k+1))  ])
    plot (p1,p2,'x-k');
    
else
    F(k+1)=F(k+1);
    p1(k+1)= p1(k+1);
    p2(k+1)= p2(k+1);
    disp([ num2str(k) ': '  num2str(p1(k+1)) ' '  num2str(p2(k+1)) '  '  num2str(F(k+1))  ])
    plot (p1,p2,'x-k');

end
k = k+1;    

end

 disp([k ': ' p1(k) ' ' p2(k) '  ' F(k)  ])

[X1,X2]=meshgrid(-3:0.1:3,-3:0.1:3);

F=   X1 - X2 + 2.*X1.^2 +2.*X1.*X2 +X2.^2; %[ALTERAR]
%F = 100.*(X2 - X1.^2).^2 + (1 - X1).^2; %EXEMPLO

hold on;
contour(X1,X2,real(F),20);


 title('Busca Aleatória') %Título
 xlabel('x1') %Eixo x
 ylabel('x2') %Eixo y


%surf(X1,X2,F);
