function funidemsional = falpha(alfa, x, s)
funidemsional=(x(1)+alfa*s(1)).^2-3.*(x(1)+alfa*s(1)).*(x(2)+alfa*s(2))+4.*(x(2)+alfa*s(2)).^2+(x(1)+alfa*s(1))-(x(2)+alfa*s(2));
end