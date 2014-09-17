function [varb] = grafica_descenso(fname, x, d)
    %
    % Grafica la función fname: R^n -> R en
    % la dirección de descenso en x.
    %
    % Omar Trejo Navarro - 119711
    %
    % Analisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   fname := cadena de caracteres con el nombre de la función f.
    %   x     := vector que representa el punto inicial.
    %   d     := vector que representa la direccion.
    %
    % Out:
    %   varb  := variable booleana:
    %            varb == 1: d es una direccion de descenso.
    %            varb == 0: d no es direccion de descenso.
    %
    gfx = gradiente(fname, x);
    der = gfx' * d;
    if der >= 0
        varb = 0;
        disp('No es direccion de descenso');
    else
        varb = 1;
        t = linspace(0, 1, 50);
        for k = 1:50
            xt = x' + t(k) * d;
            y(k) = feval(fname, xt);
        end
        plot(t, y, '--b', 0, y(1), 'sr', 'Linewidth', 3);
        title('Funcion a lo largo de d', 'Fontsize', 18);
    end
end

