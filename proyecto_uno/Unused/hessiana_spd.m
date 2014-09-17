function [H] = hessiana_spd(A)
    %
    % Hacer una matriz Hessiana positiva definida.
    %
    % Luis Roman Garcia  - 117077
    % Omar Trejo Navarro - 119711
    % Fernanda Mora Alba - 103596
    %
    % Análisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   A := matriz de nxn que se quiere hacer s.p.d.
    %
    % Out:
    %   H := matriz de nxn s.p.d. a partir de A.
    %

    % La Hessiana es simetrica por continuidad de
    % las derivadas parciales. Cholesky espera una
    % matriz simetrica.

    n = length(A);
    [~, p] = chol(A);

    if p == 0
        % La matriz es s.p.d.
        mu = 0;
    else
        % La matriz no es s.p.d.
        mu1 = min( eig( A ) );
        mu  = eps - mu1;
        H   = A + mu * eye(n, n);
    end
end
