function [ varb ] = GraficaDescenso( fname, x, d )
%grafica la función fname en la dirección de x
%La dirección de descenso para fname en x.
%In
%fname.-nombre de la funcion codifica en Matlab.
%x.- vector columna de dimension n que representa el punto en Rn
%d.- vector columna de dimension n que representa la direccion en Rn
%Out
%varb.- variable booleana varb==1, d es una direccion de descenso  y
%varb==0 d no es direccion de descenso


gfx=gradiente(fname,x);
der=gfx'*d;
if (der>=0)
    varb=0;
    disp('No es direccion de descenso')
else
    varb=1;
    t=linspace(0,1,50);
    for k=1:50
        xt =x'+t(k)*d;
        y(k)=feval(fname,xt);
    end
    plot(t,y,'--b',0,y(1),'sr','Linewidth',3)
    title('Función a lo largo de d','Fontsize',18)
    
end

end

