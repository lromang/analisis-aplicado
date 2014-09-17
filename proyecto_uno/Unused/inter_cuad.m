function [alfa] = inter_cuad(f, x, p, c1, c2)
    %
    % Interpolación cuadrática. Fuente: Nocedal pg. 57
    %
    % Luis Roman Garcia  - 117077
    % Omar Trejo Navarro - 119711
    % Fernanda Mora Alba - 103596
    %
    % Análisis Aplicado
    % Otono 2014
    % ITAM
    %
    % In:
    %   p :=   dirección de máximo descenso,
    %          en nuestro caso es -(Hess(f, x)^-1 * grad(f, x)).
    %   x :=   punto incial para el proceso.
    %   f :=   función base para encontrar maximo descenso.
    %   c1 :=  primera constante para las condiciones de Wolfe 1e-4
    %   c2 :=  segunda constante para las condiciones de Wolfe .9
    %
    % Out:
    %   alfa := tamaño del paso de descenso.
    %
    g1  = grad(f, x);
    g2  = grad(f, x + p);
    i   = 1;
    c   = f(x);
    tol = 1e4;

    % Buscamos resolver el problema de encontrar un polinómio q(x):
    %   q(x)     = a * x^2 + b * x + c              = phi1(x)
    %   q(x + p) = a * (x + p)^2 + b * (x + p) + c  = phi2(x + p)
    %   q'(x)    = phi1(x)

    % Resolvemos las ecuaciones para los coeficientes a y b,
    % y definimos alfa como el mínimo.
    a    = ( f(x) - f(x+p) - g1' * p ) / -p^2;
    b    = g1' + 2 * ( (f(x) - f(x+p) - g1'p) / p^2 ) * x;
    alfa = -b / (2 * a);

    % Se deben satisfacer las condiciones de Wolfe.
    while (f(x + alfa * p) > f(x) + alfa * c1 * g1' * p ...
        || g2'p < c2 * g1'p &&  i < tol)
        p    = alfa * p;
        alfa = alfa2 - grad(f, x + p)' * p / ...
                ( (grad(f, x + p) - ...
                  (grad(f, x + p) - grad(f, x)) / ...
                  (alfa2 - alfa1))
                ) / 2;
    end
end
