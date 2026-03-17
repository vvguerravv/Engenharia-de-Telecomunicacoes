// ex1: fork/wait básico
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int ex1() {

    int pid, status;

    pid = fork();

    if (pid == -1) {
        perror("Fork falhou!\n");
        exit(-1);
    } else if (pid == 0) { // Processo Filho

        pid = fork();
        if (pid == -1) {
            perror("Fork falhou!\n");
            exit(-1);
        } else if (pid == 0) { // Processo Neto
            printf("Processo neto\t pid: %d\t pid pai: %d\n",getpid(),getppid());
            sleep(1);
            exit(0);
        }

        wait(&status);

        printf("Processo filho\t pid: %d\t pid pai: %d\n", getpid(),getppid());
        sleep(1);
        exit(0);

    } else { // Processo Pai
        wait(&status);
        printf("Processo pai\t pid: %d\t pid pai: %d\n",getpid(), getppid());
        exit(0);
    }

}
