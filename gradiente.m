function [gfx] = gradiente(fname, a)
% Se aproxima el gradiente de fname en el vector a usando 
%diferencias hacia adelante. 
%
%In
%fname.- caadena de caracteres con el nombre en Matlab de la 
%        función f(x).
%a.- vector de dimensión n.
%Out
%gfx.- vector de dimensión n con la aproximación al gradiente.

h = 1e-5; %longitud de paso en diferencias hacia adelante
n = length(a);
gfx = zeros(n,1);
f1 = feval(fname,a);

for k = 1:n
    a(k) = a(k) + h;
    f2 = feval(fname,a);
    a(k) = a(k) - h;
    gfx(k) = (f2 - f1)/h;
    
end 
