function [L] = cholesky_nocedal(A)
    %
    % Descomposición de Cholesky.
    % Algoritmo de la pagina 51 de Nocedal.
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
    tol     = 1.e-08;
    n       = size(A);
    maxiter = 50;
    iter    = 0;
    beta    = 0.001;
    mu      = min(eig(A));
    if mu > tol
        tau = 0;
    else
        tau = beta - mu;
    end
    A      = A + tau * eye(n);
    [L, p] = chol(A, 'lower');
    while p ~= 0 && iter < maxiter
        tau    = max(2 * tau, beta);
        A      = A + tau * eye(n);
        [L, p] = chol(A, 'lower');
        iter   = iter + 1;
    end
end
