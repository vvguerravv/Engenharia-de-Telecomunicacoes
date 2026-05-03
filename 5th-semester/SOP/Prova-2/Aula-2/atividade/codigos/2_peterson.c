/*
 * 2_peterson.c
 * Solucao: Algoritmo de Peterson (1981) para 2 tarefas.
 *
 * Cada tarefa expressa o desejo de entrar (wants[task] = 1)
 * e cede gentilmente a vez para a outra (turn = other).
 * O while bloqueia somente se a outra tarefa quer entrar
 * E for a vez dela. Garante exclusao mutua e espera limitada.
 *
 * Compilar: gcc -Wall -O0 -pthread 2_peterson.c -o 2_peterson
 * Executar: ./2_peterson
 */
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

int saldo = 100;

/* --- mecanismo de exclusao mutua: Peterson --- */
volatile int turn = 0;
volatile int wants[2] = {0, 0};

void enter(int task) {
    int other = 1 - task;
    wants[task] = 1;
    turn = other;

    /* Barreira para garantir ordem de visibilidade
       das escritas em wants/turn antes da leitura. */
    __sync_synchronize();

    while (wants[other] && turn == other) {
        /* espera ocupada */
    }
}

void leave(int task) {
    __sync_synchronize();
    wants[task] = 0;
}

/* --- thread de deposito --- */
typedef struct {
    int id;
    int valor;
} arg_t;

void* depositar(void* arg) {
    arg_t* a = (arg_t*)arg;

    enter(a->id);
        int temp = saldo;        /* Passo 1: Leitura  */
        usleep(100);             /* forca troca de contexto */
        temp += a->valor;        /* Passo 2: Soma     */
        saldo = temp;            /* Passo 3: Escrita  */
    leave(a->id);

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
