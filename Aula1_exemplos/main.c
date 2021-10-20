/* Calcular algumas funções com n algarismos significativos */
#include <stdio.h>

#include "calc.h"

int main(){
	int alg;
	double x, res, inicial;

	// Calcular e^x
	printf("Entre os números x, algarismos significativos e inicial\n");
	scanf("%lf %d %lf", &x, &alg, &inicial);
	res = raiz(x, alg, inicial);
	printf("raiz(%g) = %g\n", x, res);
}
