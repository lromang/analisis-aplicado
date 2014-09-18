function [res_cuad] = ipads_res(x)
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
    %        r  := tasa de crecimiento de las ventas.
    %        K  := cantidad maxima de ventas esperadas.
    %        P0 := ventas iniciales.
    %
    % Out:
    %   res_cuad := suma de residuales al cuadrado.
    %

    % Nota: es necesario poner los datos aqui,
    % aunque sea redundante (porque ya se pusieron
    % en el archivo principal del problema) porque
    % de otra forma se deben mandar como un parametro
    % a traves de varias funciones lo cual no es una
    % solucion elegante (tampoco esta).

    datos = [03.27 04.19 07.33 04.69 09.25 11.12 15.30 11.80 ...
             17.00 14.00 22.90 19.50 14.60 14.10 26.00 16.35];

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
