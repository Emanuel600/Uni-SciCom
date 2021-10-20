#ifndef CALC_H_
#define CALC_H_

/* Conjunto de funções que retornam !double! */
// Calcula e^x para $alg algarismos
double expon(double x, int alg);
// Calcula cosseno de um ângulo $ang para $alg algorismos
double coss(double ang, int alg);
// Calcula raiz de x para $alg algarismos com valor inicial $inic
double raiz(double x, int alg, double inic);
// Calcula fatorial de n, espera números inteiros => Importante retornar double para divisões
double fact(double n);

/* Este conjunto retorna float para enfatizar erros de truncamento */
/* Calcula soma do inverso dos quadrados de x termos */
// Do maior para o menor
float som_in_mai(int x);
// Do menor para o maior
float som_in_men(int x);

#endif /* CALC_H_ */
