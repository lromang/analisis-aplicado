function [xf] = met_bus_lin(fname, x)
    %
    % Metodo de busqueda de lineal
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
    %
    % Out:
    %   xf    := vector que aproxima al minimo local.
    %
    tol     = 1.e-7;
    maxiter = 50;
    iter    = 0;
    gfx     = gradiente(fname, x);

    while(norm(gfx) > tol && iter < maxiter)
        d    = -gfx;
        varb = grafica_descenso(fname, x, d);
        pend = gfx' * d;
        alfa = paso_atras(fname, x, d, pend);
        x    = x + alfa * d;
        gfx  = gradiente(fname, x);
        iter = iter + 1;
    end
    xf = x;
end
