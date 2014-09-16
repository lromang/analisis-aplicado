function [gfx] = GraficaDescenso(fname, x, d)
    %
    % Se grafica la funci?n fname en la direcci?n de x.
    % La direcci?n d es de descenso para fname en x.
    %
    % An?lisis Aplicado
    % Oto?o 2014
    % ITAM
    %
    % In:
    % fname  := Nombre de la funci?n de Matlab que 
    %           codifica la funci?n f(x).
    % x      := Vector columna de dimensi?n n que representa
    %           el punto en R^n.
    % d      := Vector columna de dimensi?n n que representa
    %           la direcci?n en R^n.
    %
    % Out:
    % varb   := Variable boolena:
    %           verb == 1, d es una direcci?n de descenso.
    %           varb == 0, d no es direcci?n de descenso.
    
    gfx = gradiente(fname, x);
    der = gfx' * d;
    
    if (der >= 0)
        varb = 0;
        disp('No es direcci?n de descenso');
    else
        varb = 1;
        t = linspace(0, 1, 50);
        for k = 1:50;
            xt = x + t(k) * d;
            y(k) = feval(fname, xt);
        end
        plot(t, y, '--b', 0, y(1), 'sr', 'LineWidth', 3);
        title('Funci?n a lo largo de d');
    end
    
end