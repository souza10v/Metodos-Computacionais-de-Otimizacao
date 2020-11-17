% -----------------  Método de Powell -------------------------------------
% UNIVERSIDADE FEDERAL DE CATALÃO - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

function mainSpowel
close all
clear all
clc
format short

a = -3;
b = 3;
x = [1 -1];

tol = 10^-5;
nbIteracoes = 100;%definir um número grande por garantia.
nbdirecoes = 6; %número de direções
H = [eye(2) -eye(2) [1 -1;1 1]]; %H tem seis colunas %cada coluna representa uma direção de busca.

Spowel(a,b,nbIteracoes,nbdirecoes,x,tol,H)
end
