function [H] = hessiana(fname, x)
    %
    % Calculua la matriz Hessiana de f en el punto x.
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
    %   fname := cadena de caracteres que codifica la funcion f.
    %   x     := vector donde se aproxima la Hessiana.
    %
    % Out:
    %   H     := matriz Hessiana evaluada en x.
    %
    % Nota: se utilizan diferencias hacia adelante.
    %
    tol = 1.e-08;
    n  = length(x);
    H  = zeros(n);
    h  = 1.e-05;
    f1 = feval(fname, x);
    for i = 1:n
        xi    = x;
        xi(i) = xi(i) + h;
        f2    = feval(fname, xi);
        for j = 1:i
            xj     = x;
            xj(j)  = xj(j) + h;
            f3     = feval(fname, xj);
            xij    = xi;
            xij(j) = xij(j) + h;
            f4     = feval(fname, xij);
            H(i,j) = (f1 + f4 - f2 - f3) / (h^2);
            if i ~= j
                H(j,i) = H(i,j);
            end
        end
    end
end
