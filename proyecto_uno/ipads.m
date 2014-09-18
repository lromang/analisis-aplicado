%
% Proyecto 1 - Problema de iPads
%
% Omar Trejo Navarro - 119711
% Luis Roman Garcia  - 117077
% Fernanda Mora Alba - 103596
%
% Análisis Aplicado
% Otono 2014
% ITAM
%
datos = [03.27 04.19 07.33 04.69 09.25 11.12 15.30 11.80 ...
         17.00 14.00 22.90 19.50 14.60 14.10 26.00 16.35];
n  = length(datos);
t  = [1:n]';

% Parametros iniciales
% dados por el profesor:
x0 = [0.01 500 3]';

[x, iter] = met_bus_lin_newton('residuales', x0);
display(sprintf('Iteracion: iter = %d \n', iter));
display(sprintf('Aproximacion al min local: \n\n'));
display(sprintf('\t r  = %g \n', x(1)));
display(sprintf('\t K  = %g \n', x(2)));
display(sprintf('\t P0 = %g \n', x(3)));

res_cuad = residuales(x, datos);
display(sprintf('Suma de residuales: res_cuad = %g \n', res_cuad));

r  = x(1);  % Tasa de ventas de las iPads
K  = x(2);  % Cantidad máxima de ventas
P0 = x(3);  % Ventas iniciales

hold on
plot(t, datos, 'sq', t, 0*n, 'k', t, 0*n, 'dg', 'LineWidth', 2)
title('Ventas de iPads')
xlabel('Trimestre')
ylabel('Cantidad vendida')

tt = linspace(1, n);

% Modelo logistico de poblacion
Pt = K ./ (1 + ((K / P0) + 1) * exp(-r * tt));
plot(tt,Pt,'--r')

legend('Ventas de iPads', 'Función logistica', 'Location', 'NorthEast')
%legend('x*=',x,'f(x*)=',res_cuad,'||f(x*)||=',gfx,'#iter=',iter,'Location', 'SouthEast')
