% -----------------------------Seção Áurea---------------------------------
% UNIVERSIDADE FEDERAL DE GOIÁS
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

clear all; 
clc 
syms x % declara variável x
figure; 
hold on;

disp([' Método Seção Áurea: ']);

k=1;
a(k) = 0; %intervalo min
b(k) = 12;  %intervalo max
e = 0.01; %tolerância

y= a(k) + 0.382*(b(k)-a(k)); %fórmula da seção áurea
z= a(k) + 0.618*(b(k)-a(k)); %fórmula da seção áurea

fy(k)=f(y); 
fz(k)=f(z); 

plot(fy, 'k-');

plot(y,fy,'rx') % plot y X fy
plot(z,fz,'rx') % plot z X fz

 disp1 ='\n Iteração %.0f = a: %.4f , b: %.4f , fy: %.4f , fz: %4f'; 
 fprintf (disp1,(k),(a(k)),(b(k)),(fy(k)),(fz(k))); 

   while((b(k)-a(k))>e) %condição de parada
       
       if (fy(k)>fz(k)) 
        a(k+1) = y(k);
        b(k+1) = b(k);
        y(k+1) = z(k);
        z(k+1) = (a(k+1)+0.618*(b(k+1)-a(k+1)));
        fy(k+1)=f(y(k+1));                     
        fz(k+1)=f(z(k+1));
       
        plot(y(k+1),fy(k+1),'rx'); % plot y k+1 X fy k+1
        
        disp1 ='\n Iteração %.0f = a: %.4f , b: %.4f , fy: %.4f , fz: %4f'; 
        fprintf (disp1,(k+1),(a(k+1)),(b(k+1)),(fy(k+1)),(fz(k+1))); 
        
    else % procedimento para fz>fy
        a(k+1) = a(k);
        b(k+1) = z(k);
        z(k+1) = y(k);
        y(k+1) = (a(k+1)+0.382*(b(k+1)-a(k+1)));
        fy(k+1)=f(y(k+1));                     
        fz(k+1)=f(z(k+1));
        
        plot(z(k+1),fz(k+1),'rx'); % plot yz k+1 X fz k+1
        
        disp1 ='\n Iteração %.0f = a: %.4f , b: %.4f , fy: %.4f , fz: %4f'; 
        fprintf (disp1,(k+1),(a(k+1)),(b(k+1)),(fy(k+1)),(fz(k+1)));   
         
       end
       k=k+1; 
   end
   
plot(y(k),fy(k),'ko');
plot(z(k),fz(k),'ko');

x1 = a:pi/100:b; %plota f de x
y1 = f(x1);
plot(x1,y1,'b')
title('Seção Áurea') %Título
xlabel('x') %Eixo x
ylabel('f') %Eixo y
   
disp([' ']);  
disp([' Número de iterações: '  num2str(k)  ]) ; %exibe número de interações
disp([' Mínimo da função em : ' num2str(a(k)) ' ; ' num2str(b(k)) ])  ; %exibe o ponto mínimo
disp([' Valor mínimo : '  num2str(fy(k)) ' ; '  num2str(fz(k)) ]) ;  %exibe o valor da função no ponto mínimo
 