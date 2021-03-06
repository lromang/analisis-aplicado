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
    maxiter = 20;
    iter    = 0;
    gfx     = gradiente(fname, x);

    % Una forma
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

    % Otra forma
    % H = Hessiana(fname, x);
    % while (norm(gfx) > tol && iter < maxiter)
    %    Pn     = dir_newton(H, gfx);
    %    [varb] = grafica_descenso(fname, x, Pn);
    %    % x = x + d ó x = x + d'
    %    pend   = gfx' * Pn;
    %    alfa   = paso_atras(fname, x, Pn, pend, c1, c2);
    %    x      = x + alfa * Pn;
    %    gfx    = gradiente(fname, x);
    %    H      = hessiana(fname, x);
    %    iter   = iter + 1;
    % end
end
