function [Pn] = dir_newton(H, gfx)
    %
    % Calcula la direccion de Newton.
    %
    % Pn = -(f''(x))^(-1) * f'(x), resolviendo H * Pn = -gfx.
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
    %   H   := matriz Hesiana de la funcion a evaluar.
    %   gfx := gradiente de la función a evaluar.
    %
    % Out:
    %   Pn  := dirección de Newton.
    %
    L  = cholesky(H);
    y  = tri_inf(L', -gfx);
    Pn = tri_sup(L, y);
end

