function [gx] = gradiente(f, x)
    %
    % Aproximación al gradiente con diferencias centradas.
    %
    % Referencia:
    %   A new method to compute second derivatives,
    %   Hugo D. Scolnik & M. Juliana Gambini,
    %   Departamento de Computación FCEN, UBA, [ANO?]
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
    %   f  := función sobre la que se quiere aproximar el gradiente.
    %   x  := vector en el que se quiere evaluar el gradiente.
    %
    % Out:
    %   gx := el gradiente de la función f evaluado en x.
    %
    n  = size(x);
    gx = zeros(n, 1);

    % Definimos el tamaño de h con base en la referencia.
    h = eps^(1/3) * eye(n, n);

    % Calculamos la parcial respecto a cada variable.
    for  i = 1:n
        gx(i) = ( f(x + h(:,i)) - f(x - h(:,i)) ) / (2 * h(i,i));
    end
end
