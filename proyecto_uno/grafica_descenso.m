function [varb] = grafica_descenso(fname, x, d)
    %
    % Grafica la funci? f y la direcci? de descenso en x.
    %
    % Omar Trejo Navarro - 119711
    % Luis Roman Garcia  - 117077
    % Fernanda Mora Alba - 103596
    %
    % An?isis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   fname := cadena de caracteres que codifica la funcion f.
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
        disp('[!] No existe la direccion de descenso.');
    else
        varb = 1;
        t = linspace(0, 1, 50);
        for k = 1:50
            xt   = x + t(k) * d;
            y(k) = feval(fname, xt);
        end
        plot(t, y, '--b', 0, y(1), 'sr', 'Linewidth', 2);
        title('Funcion a lo largo de la direccion de Newton', 'Fontsize', 18);
        xlabel('Direccion de Newton', 'Fontsize', 14)
        ylabel('Suma de residuales al cuadrado', 'Fontsize', 14)
    end
end

