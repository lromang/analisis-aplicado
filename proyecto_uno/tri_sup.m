function [x] = tri_sup(U, b)
    %
    % Resuelve sistemas triangulares superiores
    % de la forma U * x = b.
    %
    % Omar Treio Navarro - 119711
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
    n = length(b);
    x(n)  = b(n) / U(n,n);
    for i = n-1 : -1 : 1
        x(i) = (b(i) - U(i,i+1:n) * x(i+1:n)') / U(i,i);
    end
    x = x';
end
