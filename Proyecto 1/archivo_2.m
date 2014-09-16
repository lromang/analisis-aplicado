// Funciones proyecto Análisis Aplicado

//----------------------------------------------
// Funciones para aproximar la primera y segunda
// derivadas. (SCILAB)
// Para defnir h nos basamos en 
	// file:///home/lgarcia/Downloads/
	// numericalderivatives-v0.2.pdf
// Para las fórmulas tanto de la aproximación
// al gradiente como al Hessiano nos basamos en
	// A new method to compute second derivatives
	// Hugo D. Scolnik & M. Juliana Gambini
	// Dto. de Computación FCEN, UBA
//----------------------------------------------

// Aproximación al gradiente con diferencias 
// centradas.
// IN
// f: función sobre la que se quiere aproximar
// 	  el gradiente.
// x: Vector en el que se quiere evaluar el gra-
// 	  diente. (vector columna)
// OUT
// gx: el gradiente de la función evaluado en x.
function gx = grad( f, x )

	// Tomamos el tamaño de x.
	// inicializamos gx.
	n  = size ( x, "*" );
	gx = zeros( n, 1); 

	
	// Definimos el tamaño de h 
	// basandonos en el siguiente texto

	h = %eps ^ ( 1 / 3 ) * eye( n, n );
	
	// Proceso iterativo para calcular la parcial
	// sobre cada una de las variables
	for  i = 1 : n
		gx( i ) = ( f (x + h(:, i) ) - f( x - h(:, i)) ) / ( 2 * h( i, i) );
	end
endfunction

// Aproximación a la matriz Hessiana con diferencias
// centradas.
// IN
// f: función sobre la que se quiere aproximar
// 	  la Hessiana.
// x: Vector en el que se quiere evaluar la
//    Hessiana. (vector columna)
// OUT
// gx: La Hessiana de la función evaluada en x.
function Hx = hess( f, x )

	// Tomamos el tamaño de x.
	n  = size ( x, "*" );
	Hx = zeros( n, n ); 

	// Definimos el tamaño de h 
	// basandonos en el siguiente texto
	// file:///home/lgarcia/Downloads/
	// numericalderivatives-v0.2.pdf
	h = %eps ^( 1 / 4 ) * eye( n, n );

	// Proceso iterativo para calcular las
	// segundas parciales sobre cada una
	// de las variables
	for i = 1:n
		for j = 1:n
			if i == j then
				// Estimar elementos de la diagonal.
				Hx( i,j ) = ( f( x + ( 2 * h( :, i ) ) ) - 2 * f( x + h( :, i ) ) + f( x ) ) / (h( i, i ) ^ 2);
			else 
				// Estimar elementos fuera de la
				// diagonal.
				Hx( i,j ) = ( f( x + h( :, i ) + h( :, j) ) - f( x + h( :, i ) ) - f( x + h( :, j ) ) + f( x ) ) / (h( i, i ) ^ 2);
			end
		end
	end
endfunction

//----------------------------------------------------
// Funcion para hacer que el Hessiano sea positivo
// definido. (MATLAB)
// IN
// A: Matriz de nxn que se quiere hacer s.p.d.
// OUT
// H: Matriz de nxn s.p.d. a partir de A
//----------------------------------------------------

function [ H ] = Hessianosdp( A )
n     = length(A);
[~,p] = chol(A);  // Cholesky espera una matriz simetrica. El Hessiano es simetrico por continuidad de las derivadas parciales
	if p == 0      //la matriz es s.d.p.
		mu = 0;
	else   //la matriz no es s.d.p.    
	    mu1 =   min( eig( A ) );
	    mu  = - mu1 + eps;
		H = A + mu * eye( n, n );
	end
end
//----------------------------------------------------
// Funcion para llevar a cabo interpolación cuadrática
// definido. (SCILAB)
// IN
// p: Dirección de descenso que en nuestro caso 
//	  -(Hess(f,x)^-1*grad(f,x))
// x: punto inicial 
// f: la función a la que se le quiere encontrar el paso
//    de descenso.
// c: 
// OUT
// H: Matriz de nxn s.p.d. a partir de A
// interpolación cuadrática q(alpha) = 
//----------------------------------------------------
// todavía no la termino....
function interQuad = function(f, x1, x2, TOL)
f1    = grad( f, x1 );
f2    = grad( f, x2 );
alpha = zeros( 10, 1 ); 
while abs(alpha[i] - alphakm) >= TOL do

end
endfunction
