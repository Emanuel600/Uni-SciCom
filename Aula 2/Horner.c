// Aplicar rgra de Horner em f(x)

#include "Horner.h"

// Função escrita normalmente
double freg(double x){
	return ( (x*x*x) - (6.1*x*x) + (3.2*x) + 1.5 );
}
// Função reescrita com regra de Horner
double fhor(double x){
	return ( 1.5 + ( x*( 3.2 + x*(x-6.1) ) ) );
}
