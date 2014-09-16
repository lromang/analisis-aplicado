function [gfx] = gradient(fname, x)
    %
    % Aproxima num?ricamente el gradiente de
    % fname: R^n -> R en x
    % por diferencias centradas.
    %
    % An?lisis Aplicado
    % Oto?o 2014
    % ITAM
    %
    % In:
    % fname  := Nombre de la funci?n de Matlab que 
    %           codifica la funci?n f(x).
    % x      := Vector columna de dimensi?n n donde se 
    %           evaluar? el gradiente.
    %
    % Out:
    % gxf    := Vector columna de dimensi?n n con la 
    %           aproximaci?n del gradiente de la funci?n en x.
    
    h = 1.e-05;
    n = length(x);
    gfx = zeros(n, 1);
    fx = feval(fname, x);
    
    for k = 1:n
        xt = x;
        xt(k) = xt(k) + h;
        fxt = feval(fname, xt);
        gfx(k) = (fxt - fx) / h;
    end
end