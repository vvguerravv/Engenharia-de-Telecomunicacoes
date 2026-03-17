#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int ex2() {

    int pid, status;
    int n, answer;

    answer = 1;
    n = 5;

    while (n > 0) {
        pid = fork();
        if (pid == -1) {
            perror("Fork falhou");
            exit(1);
        } else if (pid == 0) {
            answer *= n;
            printf("N = %d\t ans= %d\n",n,answer);
            exit(answer);
        } else {
            wait(&status);
            if (WIFEXITED(status)) {
                answer = WEXITSTATUS(status);
                printf("Answer = %d\n",answer);
                n--;
            }
        }
    }

    printf("%d! = %d\n", 5,answer);

    return 0;
}
