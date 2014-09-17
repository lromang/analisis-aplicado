function [fx] = trigo_res(x)
    %
    % Suma de residuales al cuadrado para el
    % problema del trigo.
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
    %   x  := vector de parametros iniciales [r ,K, P0].
    %         donde r  := tasa de crecimiento de la cosecha de trigo.
    %               K  := cosecha maxima de trigo.
    %               P0 := cosecha inicial.
    %
    % Out:
    %   fx := suma de residuales al cuadrado.
    %
    r  = x(1);
    K  = x(2);
    P0 = x(3);

    % Datos
    d=[11.72 13.38 14.10 13.87 14.80 15.58 14.36 16.30 16.91 18.16 18.43 18.70];
    d=[d 20.46 19.16 20.01 22.41 21.21 22.81 23.97 23.27 23.80 25.59 24.93 26.59];
    n = length(d);
    t = [1:n];
    for i = 1:n
        tt     = t(i);
        p(i)   = K / (1 + ((K / P0) - 1) * exp(-r * tt));
        res(i) = p(i) - d(i);
    end
    fx = (1/2) * res * res';
end
