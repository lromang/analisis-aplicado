function [L] = cholesky(A)
    %
    % Descomposición de Cholesky.
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
    %   A := matriz simmetrica.
    %
    % Out:
    %   L := matriz triangular superior tal que A = L'*L.
    %
    tol = 1.e-08;
    v   = min(eig(A));
    n   = size(A);
    if v < tol
        % Debemos ajustar el valor 0.005
        % dependiendo del problema.
        A = A + (0.005 - v) * eye(n);
    end
    for k = 1:n-1
        A(k, k)         = sqrt(A(k,k));
        A(k+1:n, k)     = A(k+1:n, k) / A(k,k);
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k+1:n, k)';
    end
    A(n,n) = sqrt(A(n,n));

    % Solo queremos la parte
    % triangular inferior:
    L      = tril(A)';
end
