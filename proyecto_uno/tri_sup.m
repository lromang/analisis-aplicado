function [x] = tri_sup(U, b)
    %
    % Resuelve sistemas triangulares superiores
    % de la forma U * x = b.
    %
    % Omar Trejo Navarro - 119711
    % Luis Roman Garcia  - 117077
    % Fernanda Mora Alba - 103596
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

    % n = length(b);

    x(n)  = b(n) / U(n,n);
    for j = n-1 : -1 : 1
        x(j) = (b(j) - U(j,j+1:n) * x(j+1:n)') / U(j,j);
    end
    x = x';
end
