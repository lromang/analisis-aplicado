function [ xf ] = MetBusLin( fname, x )
%Metodo de busqueda de linea para fname iniciando en x
%In
%fname.- nombre de la función codificada en Matlab
% x.- vector columna de  dimension n que representa el punto inicial
%Out
%xf.- vector columna de aproximacion al minimo local

tol=1.e-07;
maxiter = 10;
iter=0;

gfx = gradiente(fname, x);
while (norm(gfx)>tol && iter<maxiter)
    d = -gfx;
    [varb] = GraficaDescenso(fname,x',d);
    pause(1)
    pend = gfx'*d;
    alfa = paso_atras(fname, x, d, pend);
    x = x + alfa*d;
    gfx=gradiente(fname,x);
    iter = iter + 1;
end
    
xf=x;





end

