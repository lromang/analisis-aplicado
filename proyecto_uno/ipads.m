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
close all;
clear all;

datos = [03.27 04.19 07.33 04.69 09.25 11.12 15.30 11.80 ...
         17.00 14.00 22.90 19.50 14.60 14.10 26.00 16.35];

n  = length(datos);
t  = [1:n]';

% Parametros iniciales
% dados por el profesor:
x0 = [0.01 500 3]';

[x, iter] = met_bus_lin_newton('ipads_res', x0);
res_cuad  = ipads_res(x);
display(sprintf('\n================================='));
display(sprintf('== Aproximacion a minimo local =='));
display(sprintf('== Metodo de busqueda de linea =='));
display(sprintf('================================='));
display(sprintf('Iteraciones: \t\t %d ', iter));
display(sprintf('Aproximacion: \n'));
display(sprintf('\t r  = \t\t\t %g', x(1)));
display(sprintf('\t K  = \t\t\t %g', x(2)));
display(sprintf('\t P0 = \t\t\t %g', x(3)));
display(sprintf('\nResiduales: \t\t %g', res_cuad));
display(sprintf('================================='));

r  = x(1);  % Tasa de ventas de las iPads
K  = x(2);  % Cantidad máxima de ventas
P0 = x(3);  % Ventas iniciales

plot(t, datos, 'sq', 'LineWidth', 2)
title('Ventas de iPads', 'Fontsize', 18)
xlabel('Trimestre (1 = Q3 2010, 16 = Q2 2014)', 'Fontsize', 14)
ylabel('Cantidad vendida', 'Fontsize', 14)

tt = linspace(1, n);

% Modelo logistico de poblacion
Pt = K ./ (1 + ((K / P0) + 1) * exp(-r * tt));

hold on;
plot(tt, Pt, '--r', 'LineWidth', 2)
legend('Ventas de iPads', 'Función logistica', 'Location', 'NorthWest')
