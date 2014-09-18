function [res_cuad] = trigo_res(x)
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
    %        r  := tasa de crecimiento de la cosecha de trigo.
    %        K  := cosecha maxima de trigo esperada.
    %        P0 := cosecha inicial.
    % Out:
    %   res_cuad := suma de residuales al cuadrado.
    %

    % Nota: es necesario poner los datos aqui,
    % aunque sea redundante (porque ya se pusieron
    % en el archivo principal del problema) porque
    % de otra forma se deben mandar como un parametro
    % a traves de varias funciones lo cual no es una
    % solucion elegante (tampoco esta).

    datos  = [11.72 13.38 14.10 13.87 14.80 15.58 ...
              14.36 16.30 16.91 18.16 18.43 18.70 ...
              20.46 19.16 20.01 22.41 21.21 22.81 ...
              23.97 23.27 23.80 25.59 24.93 26.59];

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
