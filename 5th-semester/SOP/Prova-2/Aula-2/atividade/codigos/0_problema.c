/*
 * 0_problema.c
 * Codigo original da atividade (slide 39).
 * Demonstra a condicao de disputa: o saldo final NAO eh sempre 180.
 *
 * Compilar: gcc -Wall -O0 -pthread 0_problema.c -o 0_problema
 * Executar: ./0_problema
 */
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

int saldo = 100;

void* depositar(void* arg) {
    int valor = *(int*)arg;
    int temp = saldo;   /* Passo 1: Leitura */

    /* Forca a troca de contexto entre leitura e escrita,
       expondo a condicao de disputa. */
    usleep(100);

    temp += valor;      /* Passo 2: Soma   */
    saldo = temp;       /* Passo 3: Escrita */
    return NULL;
}

int main(void) {
    pthread_t t1, t2;
    int v1 = 50, v2 = 30;

    pthread_create(&t1, NULL, depositar, &v1);
    pthread_create(&t2, NULL, depositar, &v2);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Saldo final esperado: 180\n");
    printf("Saldo final obtido:   %d\n", saldo);
    return 0;
}
