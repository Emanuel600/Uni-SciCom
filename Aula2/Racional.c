// Racionalizar sqrt(x²+1)-1 => ( (x²+1)/sqrt(x²+1) ) - 1

#include <math.h>

#include "Racional.h"

// Retorna resultado da função não racionalizada
double irfunc(double x){
	return sqrt(x*x+1)-1;
}
// Retorna resultado da função racionalizada
double rafunc(double x){
	double div = (x*x+1)/sqrt(x*x+1);
	return div-1;
}
