/*
 * calc.h
 *
 *  Created on: 16 Oct 2021
 *      Author: desker
 */

#ifndef CALC_H_
#define CALC_H_
/* Conjunto de funções que retornam !double! */
// Calcula e^x para $alg algarismos
double expon(double x, int alg);
// Calcula cosseno de um ângulo $ang para $alg algorismos
double coss(double ang, int alg);
// Calcula raiz de x para $alg algarismos com valor inicial $inic
double raiz(double x, int alg, double inic);
/* Calcula soma do inverso dos quadrados de x termos */
// Do maior para o menor
double som_in_mai(int x);
// Do menor para o maior
double som_in_men(int x);

// Calcula fatorial de n, espera números inteiros
int fact(int n);

#endif /* CALC_H_ */
