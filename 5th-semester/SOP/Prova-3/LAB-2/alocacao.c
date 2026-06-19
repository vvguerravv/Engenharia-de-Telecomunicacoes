#include <stdio.h>
#include <stdlib.h>
int global = 10; // Estatica
void funcao_auto(int n) {
    int local = n; // Automatica
    printf("Local = %d\n", local);
}
int main() {
    funcao_auto(5);
    int *ptr = malloc(sizeof(int)); // Dinamica
    *ptr = 99;
    printf("Dinamica = %d\n", *ptr);
    free(ptr);
    return 0;
}
