function [x] = tri_inf(L, b)
    %
    % Resuelve sistemas triangulares inferiores
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
    %   L := matriz triangular superior.
    %   b := vector del lado derecho.
    %
    % Out:
    %   x := vector con la solucion.
    %
    n = length(b);
    for k = 1:n-1
        x(k)     = b(k) / L(k,k);
        b(k+1:n) = b(k+1:n) - x(k) * L(k+1:n, k);
    end
    x(n) = b(n) / L(n,n);
    x = x';
end
