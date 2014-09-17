function [gfx] = gradiente(fname, x)
    %
    % Aproxima numericamente el gradiente de fname: R^n -> R
    % en x usando diferencias centradas.
    %
    % Omar Trejo Navarro - 119711
    %
    % Analisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   fname := cadena de caracteres con el nombre de la función f.
    %   x     := vector donde se evalua el gradiente.
    %
    % Out:
    %   gfx   := vector con la aproximacion al gradiente.
    %
    h   = 1.e-5;
    n   = length(x);
    gfx = zeros(n, 1);
    fx  = feval(fname, x);

    for k = 1:n
        x(k)   = x(k) + h;
        fxt     = feval(fname, x);
        x(k)   = x(k) - h;
        gfx(k) = (fxt - fx) / h;
    end
end
