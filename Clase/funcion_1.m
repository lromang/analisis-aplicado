function [ fx ] = funcion1( x )
%funcion de R^4-->R para probar gradiente, hessiana y graficacion

%In
%x.-vector columna de dimension 4
%Out
%fx.- numero real con la evaluacion de la funcion en x

fx = x(1)^2+x(1)*x(2)+x(3)^2+cos(x(4));

end

