% Omar Trejo Navarro - 119711
% Luis Roman Garcia  - 117077
% Fernanda Mora Alba - 103596
%
% Análisis Aplicado
% Otono 2014
% ITAM

%Datos de las ventas de iPads desde 3Q 2010 al 2Q 2014 ( Q = trimestre )
d = [3.27 4.19 7.33 4.69 9.25 11.12 15.3 11.8 17 14 22.9 19.5 14.6 14.1 26 16.35];
n         = length(d);
t         = [1:n]';
x0        = [0.01 500 3]';
[x, iter] = met_bus_lin_newton('ipads_res', x0);
sprintf('Aproximacion al min local: x = %g', x);
sprintf('Iteracion: iter = %d', iter);

[res] = ipads_res(x, d);
sprintf('Suma de residuales: r = %g', res);

r  = x(1);  % Tasa de adaptación a la nueva tecnología
K  = x(2);  % Cantidad máxima de ventas
P0 = x(3);  % Ventas iniciales

% Graficación
plot(t, d, 'sq', t, 0*n, 'k', t, 0*n, 'dg', 'LineWidth', 2)
title('Ventas de iPads')
xlabel('Trimestre')
ylabel('Cantidad vendida')
hold on

% Ventas al tiempo t
tt = linspace(1,n);

% Modelo logistico de poblacion
Pt = K ./ (1 + ((K / P0) + 1) * exp(-r * tt));
plot(tt,Pt,'--r')

hold on
legend('Datos venta de iPads', 'función logística final', 'Location', 'NorthWest')
hold on
%legend('x*=',x,'f(x*)=',res,'||f(x*)||=',gfx,'#iter=',iter,'Location', 'SouthEast')

