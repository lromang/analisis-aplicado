function [alfa] = paso_atras(fname, x, p, pend)
    %
    % Metodo de paso hacia atras (backtracking).
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
    %   x     := vector que representa el punto donde se desciende.
    %   p     := vector con direccion de descenso.
    %   pend  := numero real con la derivada direccional de fname
    %            en x a lo largo de del vector p.
    %
    % Out:
    %   alfa  := numero real entre [0,1] donde x + alfa * p cumple
    %            las condiciones de Wolfe.
    %
    c1      = 0.5;
    c2      = 0.8;
    maxiter = 25;
    iter    = 0;
    alfa    = 1.0;
    fx      = feval(fname, x);
    xs      = x + alfa * p;
    fxs     = feval(fname, xs);

    while(fxs > fx + c1 * alfa * pend || ...
        fxs < fx + c2 * alfa * pend) ...
        && iter < maxiter

        alfa  = alfa / 2;
        xs    = x + alfa * p;
        fxs   = feval(fname, xs);
        iter  = iter + 1;
    end
end
