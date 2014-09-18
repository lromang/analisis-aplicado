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
datos  = [11.72 13.38 14.10 13.87 14.80 15.58 ...
          14.36 16.30 16.91 18.16 18.43 18.70 ...
          20.46 19.16 20.01 22.41 21.21 22.81 ...
          23.97 23.27 23.80 25.59 24.93 26.59];
n  = length(datos);
t  = [1:n]';

% Parametros iniciales
% dados por el profesor:
x0 = [0.005 1 30]';

[x, iter] = met_bus_lin_newton('residuales', x0);
display(sprintf('Iteracion: iter = %d \n', iter));
display(sprintf('Aproximacion al min local: \n\n'));
display(sprintf('\t r  = %g \n', x(1)));
display(sprintf('\t K  = %g \n', x(2)));
display(sprintf('\t P0 = %g \n', x(3)));

res_cuad = residuales(x, datos);
display(sprintf('Suma de residuales: res_cuad = %g \n', res_cuad));

r  = x(1);   % Tasa de crecimiento de la producción
K  = x(2);   % Cantidad máxima de producción
P0 = x(3);   % Producción inicial

hold on
plot(t, datos, 'sq', t, 0*n, 'k', t, 0*n, 'dg', 'LineWidth', 3)
title('Cosecha de trigo')
xlabel('Año')
ylabel('Cosecha de trigo')
tt = linspace(1, n);

% Modelo logistico de poblacion
Pt = K ./ (1 + ((K/P0) + 1) * exp(-r * tt));

plot(tt, Pt, '--r')
legend('Cosecha de trigo', 'Funcion logistica', 'Location', 'NorthEast')
