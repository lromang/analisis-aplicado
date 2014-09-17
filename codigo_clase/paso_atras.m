function [alfa] = paso_atras(fname, x, p, pend)
    %
    % Metodo de busqueda de lineal usando las condiciones
    % de las rectas en el punto x con la direccion p.
    %
    % Omar Trejo Navarro - 119711
    %
    % Análisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   fname := cadena de caracteres con el nombre de la función f.
    %   x     := vector que representa el punto donde se desciende.
    %   p     := vector de descenso.
    %   pend  := numero real con la derivada direccional de fname
    %            en x a lo largo de del vector p.
    %
    % Out:
    %   alfa  := numero real entre [0,1] donde x + alfa * p cumple
    %            las condiciones de las rectas.
    %
    c1    = 0.3;
    c2    = 0.6;
    maxiter  = 10;
    iter  = 0;
    alfa  = 1.0;
    fx    = feval(fname, x);
    xs    = x + alfa * p;
    fxs   = feval(fname, xs);

    while((fxs > fx + c1 * alfa * pend || ...
        fxs < fx + c2 * alfa * pend) ...
        && iter < maxiter )
        alfa  = alfa / 2;
        xs    = x + alfa * p;
        fxs   = feval(fname, xs);
        iter  = iter + 1;
    end
end
