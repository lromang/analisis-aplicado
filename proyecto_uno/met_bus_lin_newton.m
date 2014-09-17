function [x, iter] = met_bus_lin_newton(fname, x)
    %
    % Metodo de busqueda de linea usando la direccion de Newton.
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
    %   fname := cadena de caracteres que codifica la funcion f.
    %   x     := columna que representa el punto inicial.
    % Out:
    %   x     := vector con aproximación al mínimo local.
    %
    tol     = 1.e-7;
    maxiter = 20;
    iter    = 0;
    gfx     = gradiente(fname, x);
    H       = hessiana(fname, x);

    while norm(gfx) > tol && iter < maxiter
       Pn   = dir_newton(H, gfx);

       % Para poder observar las graficas.
       varb = grafica_descenso(fname, x, Pn);
       pause(1)

       pend = gfx' * Pn;
       alfa = paso_atras(fname, x, Pn, pend);
       x    = x + alfa * Pn;
       gfx  = gradiente(fname, x);
       H    = hessiana(fname, x);
       iter = iter + 1;
    end
end

