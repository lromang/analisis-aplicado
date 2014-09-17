function [Pn] = dir_newton(H, gfx)
    %
    % Calcular la direccion de Newton: Pn = -(f''(x))^(-1) * f'(x)
    %
    % Omar Trejo Navarro - 119711
    %
    % Analisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   H   := matriz Hesiana s.p.d. de la funcion a evaluar.
    %   gfx := gradiente de la función a evaluar.
    %
    % Out:
    %   Pn  := dirección de Newton.
    %
    [L, p] = chol(H);
    if p ~= 0
        m = -min(eig(H)) + 0.005;
        L = chol(H + m * eye(size(H)));
    end
    y  = tri_inf(L', -gfx);
    Pn = tri_sup(L, y);
end

