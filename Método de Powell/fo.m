% -----------------  M�todo de Powell -------------------------------------
% UNIVERSIDADE FEDERAL DE CATAL�O - UFCAT
% github.com/souza10v
% souza10vv@gmail.com
% -------------------------------------------------------------------------

%Fun��o objetivo
function fo = fo(x)
fo = x(1).^2-3.*x(1).*x(2)+4.*x(2).^2+x(1)-x(2);