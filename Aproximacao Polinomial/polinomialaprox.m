% ---------------------- Método Aproximação Polinomial --------------------
% UNIVERSIDADE FEDERAL DE CATALÃO
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------


clear all;  
clc 
syms x c1 c2 c3 c4 c5 
figure, hold on; 

disp([' Método Aproximação Polinomial ']);

a=-20; %intervalo min [ALTERAR]
b=20; %intervalo max [ALTERAR]
n=2; %quantidade de variáveis (grau máximo do poli) [ALTERAR]

if n == 1
    p(x)=c1+c2*x;
elseif n==2
    p(x)=c1+c2*x+c3*x^2;
elseif n==3
    p(x)=c1+c2*x+c3*x^2+c4*x^3;
elseif n==4
    p(x)=c1+c2*x+c3*x^2+c4*x^3+c5*x^4;
else
    disp([' N inválido. ']);
end

p1=diff(p,x); %deriva a função p talvez tirar

alfa=(a-b)/(n+2); 

for i = 1:(n+1)  %calcula pontos
 po(i)= a+i*(alfa);  %gera pontos. ponto (po)
 fu(i)=f(po(i));  %acha o valor da função no ponto.
 pr(i)=p(po(i)); %armazena p(x) para o ponto. ponto randon(pr)
end

for i = 1:(n+1)  %cria as equações
 eq(i)= pr(i)==fu(i);                     %equação(eq)
end

if n == 1
   sol = solve([eq(1), eq(2)], [c1, c2]); %monta o sistema linear
   c1sol = vpa(sol.c1); %resolve em c1 .número. vpa tira o número da forma de fração para decimal
   c2sol = vpa(sol.c2); %resolve em c2. valor de x %c1sol
   disp1 ='\n c1: %.4f c2: %.4f \n'; %imprime os valores c1 e c2
   fprintf (disp1,c1sol,c2sol); %imprime os valores c1 e c2
   p1(x)=c1sol+c2sol*x; %monta a função
   disp2=char(p1); %imprime a função.
   disp([' Função : ' disp2]);  
   
   if p1(a)>p1(b)
     pm=b;
     fv=p1(b);
   else
     pm=a;
     fv=p1(a);
   end
   
   disp3 ='\n Ponto mínimo(x) %.4f e o valor mínimo(f): %.4f ';
   fprintf (disp3,pm,fv); 
    
  x = a:pi/100:b; %plota f de x
  y = f(x);
  plot(x,y,'r')

  x = a:pi/100:b; %plota p1 de x
  z = p1(x);
  plot(x,z,'g')
  title('Método Aproximação Polinomial') %titulo
  xlabel('x') %eixo x
  ylabel('f') %eixo y


elseif n==2
   sol = solve([eq(1), eq(2), eq(3)], [c1, c2, c3]); %monta o sistema linear
   c1sol = vpa(sol.c1); %resolve em c1 .número
   c2sol = vpa(sol.c2); %resolve em c2. valor de x
   c3sol = vpa(sol.c3); %resolve em c3. valor de x^2
   disp1 ='\n c1: %.4f c2: %.4f c3: %.4f \n' ; %imprime os valores c1 e c2
   fprintf (disp1,c1sol,c2sol,c3sol); %imprime os valores c1 e c2
   p1(x)=c3sol*x^2+c2sol*x+c1sol; %monta a função
   disp2=char(p1); %imprime a função.
   disp([' Função : ' disp2]); 
   pd=diff(p1,x)==0; %pderivada talvez erro por igualar a 0
   sol2 = solve(pd,x); %achando valor de x. o ponto mínimo em 
   fv=p1(sol2);  %valor da função no ponto x. valor mínimo em f.
   disp3 ='\n Ponto mínimo(x) %.4f e o valor mínimo(f): %.4f ';
   fprintf (disp3, sol2, fv)
   
   x = a:pi/100:b; %plota f de x
   y1 = f(x);
   plot(x,y1,'r')

   x = a:pi/100:b; %plota p1 de x
   z = p1(x);
   plot(x,z,'g')

   plot(sol2,fv,'k-o'); %plota ponto mínimo
   title('Método Aproximação Polinomial') %titulo
   xlabel('x') %eixo x
   ylabel('f') %eixo y

   
elseif n==3
   sol = solve([eq(1), eq(2), eq(3), eq(4)], [c1, c2, c3, c4]); %monta o sistema linear
   c1sol = vpa(sol.c1); %resolve em c1 .número
   c2sol = vpa(sol.c2); %resolve em c2. valor de x
   c3sol = vpa(sol.c3); %resolve em c3. valor de x^2
   c4sol = vpa(sol.c4); %resolve em c4. valor de x^3
   c1sol = round(double(c1sol),4); %double converte de sym para double. round arredonda em 4 casas
   c2sol = round(double(c2sol),4);
   c3sol = round(double(c3sol),4);
   c4sol = round(double(c4sol),4);
   disp1 ='\n c1: %.4f c2: %.4f c3: %.4f c4: %.4f \n' ; %imprime os valores c1 e c2
   fprintf (disp1,c1sol,c2sol,c3sol,c4sol); %imprime os valores c1 e c2
   p1(x)=(vpa(c4sol*x^3+c3sol*x^2+c2sol*x+c1sol)); %monta a função
   disp2=char(p1); %imprime a função.
   disp([' Função : ' disp2]); 
   pd=diff(p1,x)==0; %pderivada talvez erro por igualar a 0. pd=p derivada 
   p2 = [3*c4sol 2*c3sol 1*c2sol]; %p1 = vetor com a derivada e valores de c
   xv = roots(p2); %xv valores das raizes de p com os cs
   
%    disp3 ='\n Raizes: %.4f e %.4f \n';
%    fprintf ( disp3, xv(1,1), xv(2,1));
   
   for i= 1:2
   if xv(i,1) ~= 0
       sol2(i)= xv(i,1);
       fv(i)=p1(sol2(i));    
   end
   end
   
   disp4 ='\n Ponto mínimo(x) %.4f e %.4f e o valor mínimo(f): %.4f e %.4f ';
   fprintf (disp4, sol2(1,1), sol2(1,2), fv(1), fv(2));
   
   x = a:pi/100:b; %plota f de x
   y1 = f(x);
   plot(x,y1,'b')

   x = a:pi/100:b; %plota p1 de x
   z = p1(x);
   plot(x,z,'g')
   
   plot(sol2(1,1),fv(1),'ko'); %plota ponto mínimo
   plot(sol2(1,2),fv(2),'ko');
   title('Método Aproximação Polinomial') %titulo
   xlabel('x') %eixo x
   ylabel('f') %eixo y

elseif n==4
    p(x)=c1+c2*x+c3*x^2+c4*x^3+c5*x^4;
else
    disp([' N inválido. ']);
end
