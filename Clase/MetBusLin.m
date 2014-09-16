function [xf] = MetBusLin(fname, x)
    %
    % M?todo de b?squeda de linea para fname iniciando en x.
    %
    % An?lisis Aplicado
    % Oto?o 2014
    % ITAM
    %
    % In:
    % fname     := Nombre de la funci?n codificada de Matlab.
    % x         := Vector columna de dimensi?n n que representa
    %              el punto inicial.
    %
    % Out:
    % xf        := Vector columna de dimensi?n que es una 
    %              aproximaci?n al m?nimo local.
    %
    
    tol = 1.e-7;
    maxiter = 50;
    iter = 0;
    gfx = gradiente(fname, x);
    
    while(norm(gfx) > tol && iter < maxiter)
        d = -gfx;
        [varb] = GraficaDescenso(fname, x, d);
        pause(2);
        x = x + d;
        gfx = gradiente(fname, x);
    end
    
    xf = x;
end