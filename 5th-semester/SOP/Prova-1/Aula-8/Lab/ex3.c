#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int ex3() {

    char comando[256];
    int pid, status;
    int background;

    while (1) {
        printf("$ ");
        fflush(stdout);

        if (fgets(comando, sizeof(comando), stdin) == NULL) {
            break;  // EOF
        }

        size_t len = strlen(comando);
        if (len > 0 && comando[len - 1] == '\n') {
            comando[len - 1] = '\0';
            len--;
        }

        if (len == 0) {
            continue;
        }

        if (strcmp(comando, "sair") == 0) {
            printf("Saindo do terminal...\n");
            break;
        }

        background = 0;
        if (len > 0 && comando[len - 1] == '&') {
            background = 1;
            comando[len - 1] = '\0';  
            while (len > 0 && comando[len - 1] == ' ') {
                comando[--len] = '\0';
            }
        }

        pid = fork();
        if (pid == -1) {
            perror("Fork falhou");
            continue;
        } else if (pid == 0) {
            // Processo filho: executa o comando
            // execve espera um array de argumentos 
            char *argv[] = {comando, NULL};
            char *envp[] = {NULL};

            if (execve(comando, argv, envp) == -1) {
                perror("Erro ao executar");
                exit(1);
            }
        } else {
            // Processo pai
            if (background) {
                printf("[PID %d] Executando em background\n", pid);
            } else {
                // Aguarda o término do processo filho
                wait(&status);
                if (WIFEXITED(status)) {
                    printf("[PID %d] Saída: %d\n", pid, WEXITSTATUS(status));
                } else if (WIFSIGNALED(status)) {
                    printf("[PID %d] Terminado por sinal %d\n", pid, WTERMSIG(status));
                }
            }
        }
    }

    return 0;
}
