% -------------------------Método de Fibonacci-----------------------------
% UNIVERSIDADE FEDERAL DE CATALÃO - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

clear all;  
clc 
syms x % declara variável x
figure; 
hold on;
k=2;

disp([' Método de Fibonacci ']);

a = 0; %intervalo min
b = 12;  %intervalo max
e = 0.01; %tolerância
h = 0.005;

n1=(log(e/b));
n2=(log(0.618));
n=n1/n2; %quantidade de iterações

n = ceil(n); %
j = n+2;
fn(1)=1; 
fn(2)=1; 

a(2) = a; 
b(2) = b;  

for i = 3:(n+2) 
 fn(i)=fn(i-1)+fn(i-2);      
end

fbi=((1+2*h)*(b-a))/e; %fibonacci inicial

u=2;                
while fbi>fn(u) 
      u=u+1;
end
fbi=fn(u);

k=2;
r(k)=1-(fn(j-1)/fn(j)); 
y(k)=a(k)+r(k)*(b(k)-a(k));
z(k)=a(k)+(1-r(k))*(b(k)-a(k));
fy(k)=f(y(k));
fz(k)=f(z(k));

disp1 ='\n Iteração %.0f = a: %.4f , b: %.4f , fy: %.4f , fz: %4f';  
fprintf (disp1,(k-1),(a(k)),(b(k)),(fy(k)),(fz(k)));
 
while fn(j-1)/fn(j) > fn(2)/fn(3)
    
     if (fy(k)>fz(k)) %Procedimento para fy>fz
        r(k+1)=1-(fn(j-1)/fn(j));
        a(k+1)=y(k);
        b(k+1)=b(k);
        y(k+1)=z(k);
        z(k+1)=a(k+1)+(1-r(k+1))*(b(k+1)-a(k+1));
        fy(k+1)=f(y(k+1));                     
        fz(k+1)=f(z(k+1));
     
        plot(y(k+1),fy(k+1),'rx');
        
        disp1 ='\n Iteração %.0f = a: %.4f , b: %.4f , fy: %.4f , fz: %4f'; 
        fprintf (disp1,(k),(a(k+1)),(b(k+1)),(fy(k+1)),(fz(k+1)));   
    
     else
         
        r(k+1)=1-(fn(j-1)/fn(j));
        a(k+1)=a(k);
        b(k+1)=z(k);
        z(k+1)=y(k);
        y(k+1)=a(k+1)+(r(k+1))*(b(k+1)-a(k+1));
        fy(k+1)=f(y(k+1));                     
        fz(k+1)=f(z(k+1));       
     
        plot(z(k+1),fz(k+1),'rx');
        
        disp1 ='\n Iteração %.0f = a: %.4f , b: %.4f , fy: %.4f , fz: %4f';  
        fprintf (disp1,(k),(a(k+1)),(b(k+1)),(fy(k+1)),(fz(k+1)));  

     end
     
j=j-1;
k=k+1;

end

plot(y(k),fy(k),'ko');
plot(z(k),fz(k),'ko');
title('Fibonnaci') %Título
xlabel('x') %Eixo x
ylabel('f') %Eixo y

x1 = a:pi/100:b; %plota f de x
y1 = f(x1);
plot(x1,y1,'b')

disp([' ']);   
disp([' Número de iterações: '  num2str(k-1)  ]) ; %exibe número de interações
disp([' Mínimo da função em : ' num2str(a(k)) ' ; ' num2str(b(k)) ])  ; %exibe o ponto mínimo
disp([' Valor mínimo : '  num2str(fy(k)) ' ; '  num2str(fz(k)) ]) ;  %exibe o valor da função no ponto mínimo

%for con até n
