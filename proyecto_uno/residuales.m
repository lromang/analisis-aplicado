function [res_cuad] = residuales(x, datos)
    %
    % Suma de residuales al cuadrado.
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
    %
    %         En el caso de iPads:
    %           r  := tasa de crecimiento de las ventas.
    %           K  := cantidad maxima de ventas esperadas.
    %           P0 := ventas iniciales.
    %
    %         En el caso de trigo:
    %           r  := tasa de crecimiento de la cosecha de trigo.
    %           K  := cosecha maxima de trigo esperada.
    %           P0 := cosecha inicial.
    % Out:
    %   res_cuad := suma de residuales al cuadrado.
    %
    r  = x(1);
    K  = x(2);
    P0 = x(3);
    n  = length(datos);
    t  = [1:n];
    for i = 1:n
        tt     = t(i);
        % Modelo logistico de poblacion
        p(i)   = K / (1 + ((K / P0) - 1) * exp(-r * tt));
        res(i) = p(i) - datos(i);
    end
    res_cuad = (1/2) * res * res';
end
