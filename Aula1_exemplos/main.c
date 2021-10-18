/* Calcular algumas funções com n algarismos significativos */
#include <stdio.h>

#include "calc.h"

int main(){
	int x;
	double res_mai, res_men;

	printf("Entre com o valor de x\n");

	scanf("%d", &x);

	res_mai = som_in_mai(x);
	res_men = som_in_men(x);

	printf("O valor da soma com %d termos:\n", x);
	printf("maior->menor: %.16lf\n", res_mai);
	printf("menor->maior: %.16lf\n", res_men);
}
