#include <stdio.h>

#include "Horner.h"
#include "Racional.h"

int main(){
	double x, res_nh, res_ho;

	printf("Entre com o número x para f(x): ");
	scanf("%lf", &x);

	res_nh = freg(x);
	res_ho = fhor(x);

	printf("\\===Resultados===/\n");
	printf("Resultado com:\n");
	printf("Função normal: %.16g\n", res_nh);
	printf("Função de Hroner: %.16g\n", res_ho);
}
