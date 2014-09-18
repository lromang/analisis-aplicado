function [fx] = ipads_res(x, d)
    %
    % Suma de residuales al cuadrado para el
    % problema de las iPads.
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
    %   x := vector de parametros iniciales [r ,K, P0].
    %        donde r  := tasa de crecimiento de las ventas.
    %              K  := cantidad máxima de ventas esperadas.
    %              P0 := ventas iniciales.
    %
    % Out:
    %   fx := suma de residuales al cuadrado.
    %
    r  = x(1);
    K  = x(2);
    P0 = x(3);
    n  = length(d);
    t  = [1:n];
    for i = 1:n
        tt     = t(i);
        p(i)   = K / (1 + ((K / P0) - 1) * exp(-r * tt));
        res(i) = p(i) - d(i);
    end
    fx = (1/2) * res * res';
end
