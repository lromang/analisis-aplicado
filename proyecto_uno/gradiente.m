function [gfx] = gradiente(fname, x)
    %
    % Aproxima el gradiente con diferencias centradas.
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
        xt     = x;
        x(k)   = x(k) + h;
        fxt    = feval(fname, x);
        x(k)   = x(k) - h;
        gfx(k) = (fxt - fx) / h;
    end
end
