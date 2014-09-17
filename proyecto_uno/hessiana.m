function [Hx] = hessiana( f, x )
    %
    % Aproximación a la matriz Hessiana con diferencias centradas.
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
    %   f := función sobre la que se quiere aproximar la Hessiana.
    %   x := Vector en el que se quiere evaluar la Hessiana.
    %
    % Out:
    %   gx := La Hessiana de la función f evaluada en x.
    %

    n  = size(x);
    Hx = zeros(n, n);

    % Definimos el tamaño de h con base en la referencia.
    h = eps^(1/4) * eye(n, n);

    % Calculamos las segundas parciales de cada variable.
    for i = 1:n
        for j = 1:n
            if i == j
                % Estimar elementos de la diagonal.
                Hx(i,j) = (f(x + 2 * h(:,i)) - ...
                           2 * f(x + h(:,i)) + ...
                           f(x)) / (h(i,i)^2);
            else
                % Estimar elementos fuera de la diagonal.
                Hx(i,j) = (f(x + h(:,i)  + ...
                           h(:,j))       - ...
                           f(x + h(:,i)) - ...
                           f(x + h(:,j)) + ...
                           f(x)) / (h(i,i)^2);
            end
        end
    end
end
