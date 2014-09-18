function [L] = cholesky(A)
    %
    % Descomposición de Cholesky.
    %
    % Omar Trejo Namuarro - 119711
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
    mu  = min(eig(A));
    n   = size(A);
    if mu < tol
        A = A + (0.004 - mu) * eye(n);
    end
    for k = 1:n-1
        A(k,k)          = sqrt(A(k,k));
        A(k+1:n, k)     = A(k+1:n, k) / A(k,k);
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k+1:n, k)';
    end
    A(n,n) = sqrt(A(n,n));
    L = tril(A)';
end
