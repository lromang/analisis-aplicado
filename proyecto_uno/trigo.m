% Omar Trejo Navarro - 119711
% Luis Roman Garcia  - 117077
% Fernanda Mora Alba - 103596
%
% Análisis Aplicado
% Otono 2014
% ITAM

%Datos de la cosecha de trigo en toneladas durante 24 años
d=[11.72 13.38 14.10 13.87 14.80 15.58 14.36 16.30 16.91 18.16 18.43 18.70];
d=[d 20.46 19.16 20.01 22.41 21.21 22.81 23.97 23.27 23.80 25.59 24.93 26.59];
n=length(d);
t=[1:n]';

%Punto inicial
x0 = [0.005 1 30]';

%Método de Búsqueda de Línea utilizando dirección de Newton
[x, iter] = met_bus_lin_newton('trigo_res', x0);
display(sprintf('Aproximacion al min local: x = %g', x));
sprintf('Iteracion: iter = %d', iter);

%Suma de residuales al cuadrado
res = trigo_res(x);
sprintf('Suma de residuales: r = %g', res);

r  = x(1);   % Tasa de crecimiento de la producción
K  = x(2);   % Cantidad máxima de producción
P0 = x(3);   % Producción inicial

% Graficación
plot(t, d, 'sq', t, 0*n, 'k', t, 0*n, 'dg', 'LineWidth', 3)
title('Datos de la cosecha de trigo')
xlabel('Año')
ylabel('Cosecha de Trigo en Toneladas')
hold on

% Cosecha al tiempo t
tt = linspace(1,n);

% Modelo logistico de poblacion
Pt = K ./ (1 + ((K/P0) + 1) * exp(-r * tt));

plot(tt,Pt,'--r')
hold on
legend('datos iniciales', 'función logística dinal', 'Location', 'NorthWest')

