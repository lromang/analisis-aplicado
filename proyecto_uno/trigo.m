%
% Proyecto 1 - Problema de trigo
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

datos  = [11.72 13.38 14.10 13.87 14.80 15.58 ...
          14.36 16.30 16.91 18.16 18.43 18.70 ...
          20.46 19.16 20.01 22.41 21.21 22.81 ...
          23.97 23.27 23.80 25.59 24.93 26.59];

n  = length(datos);
t  = [1:n]';

% Parametros iniciales
% dados por el profesor:
x0 = [0.005 1 30]';

[x, iter] = met_bus_lin_newton('trigo_res', x0);
res_cuad  = trigo_res(x);
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

r  = x(1);   % Tasa de crecimiento de la producción
K  = x(2);   % Cantidad máxima de producción
P0 = x(3);   % Producción inicial

plot(t, datos, 'sq', 'LineWidth', 2)
title('Cosecha de trigo', 'Fontsize', 18)
xlabel('An~o', 'Fontsize', 14)
ylabel('Cosecha de trigo', 'Fontsize', 14)

tt = linspace(1, n);

% Modelo logistico de poblacion
Pt = K ./ (1 + ((K/P0) + 1) * exp(-r * tt));

hold on;
plot(tt, Pt, '--r', 'LineWidth', 2)
legend('Cosecha de trigo', 'Funcion logistica', 'Location', 'NorthWest')
