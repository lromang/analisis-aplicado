function [x] = tri_sup(U, b)
    %
    % Resolver sistemas triangulares superiores
    % de la forma U * x = b.
    %
    % Omar Trejo Navarro - 119711
    %
    % Análisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   U := matriz triangular superior.
    %   b := vector del lado derecho.
    %
    % Out:
    %   x := vector con la solucion.
    %
    [n n] = size(U);
    x(n)  = b(n)/U(n,n);
    for j = n-1:-1:1
        x(j) = (b(j) - U(j,j+1:n) * x(j+1:n)') / U(j,j);
    end
    x = x';
end
