/*
 * 1_alternancia.c
 * Solucao: Alternancia de Uso (strict turn-taking).
 *
 * Existe uma variavel global "turn" que indica qual tarefa
 * pode entrar na secao critica. Cada tarefa so entra quando
 * turn == task. Ao sair, passa o turno para a proxima.
 *
 * Compilar: gcc -Wall -O0 -pthread 1_alternancia.c -o 1_alternancia
 * Executar: ./1_alternancia
 */
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

#define NUM_TASKS 2

int saldo = 100;

/* --- mecanismo de exclusao mutua: alternancia de uso --- */
volatile int turn = 0;  /* comeca pela tarefa 0 */

void enter(int task) {
    while (turn != task) {
        /* espera ocupada ate ser sua vez */
    }
}

void leave(int task) {
    (void)task;
    turn = (turn + 1) % NUM_TASKS;
}

/* --- thread de deposito --- */
typedef struct {
    int id;
    int valor;
} arg_t;

void* depositar(void* arg) {
    arg_t* a = (arg_t*)arg;

    enter(a->id);                /* entra na secao critica */
        int temp = saldo;        /* Passo 1: Leitura  */
        usleep(100);             /* forca troca de contexto */
        temp += a->valor;        /* Passo 2: Soma     */
        saldo = temp;            /* Passo 3: Escrita  */
    leave(a->id);                /* libera a secao critica */

    return NULL;
}

int main(void) {
    pthread_t t1, t2;
    arg_t a1 = {0, 50};
    arg_t a2 = {1, 30};

    pthread_create(&t1, NULL, depositar, &a1);
    pthread_create(&t2, NULL, depositar, &a2);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Saldo final esperado: 180\n");
    printf("Saldo final obtido:   %d\n", saldo);
    return 0;
}
