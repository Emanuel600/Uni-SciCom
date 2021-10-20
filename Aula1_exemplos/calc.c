/* Estimar resultado de funções e aplicar funções matemáticas */

// Aparenta funcionar melhor para números pequenos [0-1]

#include <stdio.h>
#include <math.h>

#include "calc.h"

// x é o exponente e alg é o número de algarismos significativos
double expon(double x, int alg){
	double res = 1;
	double i = 1;

	double es = pow(10, 2-alg)/2;

	while(1){
		double re1 = res;
		res += ( (pow(x, i))/fact(i) );
		// Calcular erro aproximado
		double err = 100*(res-re1)/res;

		printf("Err: %g\n", err);

		if (err < es )
			break;
		i++;
	}

	return res;
}
// Calcula cosseno($ang) para $alg algarismos
double coss(double ang, int alg){
	double res = 1;
	double i = 1;

	double es = pow(10, 2-alg)/2;

	while(1){
		double re1 = res;

		res += pow(-1, i) * (pow(ang, 2*i)/fact(2*i));

		printf("res: %g\n", res);

		// Calcular erro aproximado
		double err = 100*(res-re1);

		if (err<0)
			err *= -1;

		err /= res;

		if(isnan(err))
			break;

		printf("Err: %g\n", err);

		if (err < es )
			break;
		i++;
	}

	return res;
}
// Calcular raiz de x para $alg algarismos com valor $inic inicial
double raiz(double x, int alg, double inic){
	double res = inic;
	double es = pow(10, 2-alg)/2;

	while(1){
		res = (inic + x/inic)/2;
		//printf("Aproxima sqrt(%g) como {%g}\n", x, res);
		// Calcular erro | abs() não funcionou |
		double err = (res-inic)*100;
		if (err<0)
			err *= -1;
		err /= res;

		if (err < es )
			break;
		inic = res;
	}

	return res;
}
// Calcula soma do inverso dos quadrados de 1 a x, do maior para o menor
float som_in_mai(int x){
	float i;
	float res = 0;

	for (i=1; i<x+1; i++)
		res += 1/(i*i);

	return res;
}
// Calcula soma do inverso dos quadrados de 1 a x, do menor para o maior
float som_in_men(int x){
	float i;
	float res = 0;

	for (i=x; i>0; i--)
		res += 1/(i*i);

	return res;
}

// Calcula fatorial de n
double fact(double n){
	if(n == 0)
		return 1;
	return (n * fact(n-1));
}
