function [ alfa ] = paso_atras(fname,x, p, pend)
% Búsqueda de línea usando las condiciones de las rectas en el punto
% x con la dirección p.

% Análisis Aplicado
% 26 de agosto de 2014
%  ITAM

%In
% fname.-cadena con el nombre de la función en Matlab.
%x.- vector columna en R^n que representa el punto donde se desciende.
%p.- vector de descenso de opreden n.
%pend.- número real con la derivada direccional de fname en x a lo largo de
%        del vector p.
%Out
%alfa.- número real entre [0,1] donde x + alfa*p cumpla las
%       condiciones de las rectas.

c1 = 0.3;
c2 = 0.6;
jmax = 10;
jiter = 0;
alfa = 1.0;
fx = feval(fname,x);
xs = x+ alfa*p;
fxs = feval(fname,xs);

while( ( (fxs > fx + c1*alfa*pend) || (fxs < fx + c2*alfa*pend)  ) && jiter < jmax )
    alfa = alfa/2;
    xs = x + alfa*p;
    fxs = feval(fname,xs);
    jiter = jiter + 1;
end













end

