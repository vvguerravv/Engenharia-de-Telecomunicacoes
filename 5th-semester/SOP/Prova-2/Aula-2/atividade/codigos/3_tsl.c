/*
 * 3_tsl.c
 * Solucao: Test-and-Set Lock (TSL) - operacao atomica.
 *
 * A instrucao TSL le o valor antigo e escreve 1 atomicamente,
 * em um unico passo indivisivel. Se o valor antigo era 0, a
 * tarefa entra na secao critica; se era 1, fica em espera ocupada.
 *
 * Aqui usamos a built-in do GCC __sync_lock_test_and_set, que
 * gera a instrucao atomica equivalente (XCHG/LOCK CMPXCHG no x86).
 *
 * Compilar: gcc -Wall -O0 -pthread 3_tsl.c -o 3_tsl
 * Executar: ./3_tsl
 */
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

int saldo = 100;

/* --- mecanismo de exclusao mutua: TSL --- */
volatile int lock = 0;

/* TSL atomico: equivalente a:
   old = *x; *x = 1; return old;  (porem indivisivel) */
static inline int TSL(volatile int *x) {
    return __sync_lock_test_and_set(x, 1);
}

void enter(volatile int *l) {
    while (TSL(l)) {
        /* espera ocupada: enquanto TSL retornar 1,
           significa que a trava ja estava fechada. */
    }
}

void leave(volatile int *l) {
    __sync_lock_release(l);   /* equivale a *l = 0 com barreira */
}

/* --- thread de deposito --- */
void* depositar(void* arg) {
    int valor = *(int*)arg;

    enter(&lock);
        int temp = saldo;        /* Passo 1: Leitura  */
        usleep(100);             /* forca troca de contexto */
        temp += valor;           /* Passo 2: Soma     */
        saldo = temp;            /* Passo 3: Escrita  */
    leave(&lock);

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
