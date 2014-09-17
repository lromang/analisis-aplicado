function [fx] = funcion_uno(x)
    %
    % Funcion de R^4 -> R para probar gradiente,
    % hessiana y graficacion.
    %
    % Omar Trejo Navarro - 119711
    %
    % Analisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   x  := vector columna de dimension cuatro.
    %
    % Out:
    %   fx := numero real con la evaluacion de la funcion en x.
    %
    fx = x(1)^2 + x(1) * x(2) + x(3)^2 + cos(x(4));
end

