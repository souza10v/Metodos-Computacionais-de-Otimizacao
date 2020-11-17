% -----------------  Método de Powell -------------------------------------
% UNIVERSIDADE FEDERAL DE CATALÃO - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

%Função objetivo
function fo = fo(x)
fo = x(1).^2-3.*x(1).*x(2)+4.*x(2).^2+x(1)-x(2);