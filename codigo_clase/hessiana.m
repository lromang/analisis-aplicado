function [H] = hessiana(fname, x)
    %
    % Calcular la matriz Hessiana en el punto x.
    %
    % Omar Trejo Navarro - 119711
    %
    % Análisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   fname := cadena con el nombre de la función en Matlab.
    %   x     := vector columna de R^n donde se aproxima la Hessiana.
    %
    % Out:
    %   H     := matriz Hessiana evaluada en x.
    %
    % Nota: se utilizan diferencias hacia adelante.
    %
    n  = length(x);
    H  = zeros(n);
    h  = 1.e-05;
    f1 = feval(fname, x);

    for i = 1:n
        xi = x;
        xi(i) = xi(i) + h;
        f2 = feval(fname, xi);
        for j = 1:i
            xj     = x;
            xj(j)  = xj(j) + h;
            f3     = feval(fname, xj);
            xij    = xi;
            xij(j) = xij(j) + h;
            f4     = feval(fname, xij);
            H(i,j) = (f4 - f2 - f3 + f1) / (h^2);
            if (i ~= j)
                % Completar la diagonal
                H(j,i) = H(i,j);
            end
        end
    end
end
