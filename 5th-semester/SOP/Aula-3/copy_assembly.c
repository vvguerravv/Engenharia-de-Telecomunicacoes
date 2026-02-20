
// Import de bibliotecas

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

// Definições de variáveis

#define SIZE 128

int myopen(const char *filename, int flags, size_t buffersize) {

    int fd = 0;

//   Movimentação || par. de entrada || par. de saída
    __asm__("mov %0, %%rdi" : : "r"(filename));
    __asm__("mov %0, %%esi" : : "r"(flags));
    __asm__("mov %0, %%rdx" : : "r"(buffersize));

    __asm__("mov $2, %rax");

    __asm__("syscall");
    __asm__("mov %%eax, %0" : "=r"(fd) : );

    return fd;
}

int myread(int file, void *buff, size_t count) {

    int fd = 0;
    //   Movimentação || par. de entrada || par. de saída
    __asm__("mov %0, %%edi" : : "r"(file));
    __asm__("mov %0, %%rsi" : : "r"(buff));
    __asm__("mov %0, %%rdx" : : "r"(count));

    __asm__("mov $0, %rax");

    __asm__("syscall");
    __asm__("mov %%eax, %0" : "=r"(fd) : );

    return fd;
}

int mywrite(int file, void *buff, size_t count) {

    int fd = 0;

//   Movimentação || par. de entrada || par. de saída
    __asm__("mov %0, %%edi" : : "r"(file));
    __asm__("mov %0, %%rsi" : : "r"(buff));
    __asm__("mov %0, %%rdx" : : "r"(count));

    __asm__("mov $1, %rax");

    __asm__("syscall");
    __asm__("mov %%eax, %0" : "=r"(fd) : );
    return fd;
}

int myclose(int file) {

    int fd = 0;

//   Movimentação || par. de entrada || par. de saída
    __asm__("mov %0, %%edi" : : "r"(file));

    __asm__("mov $3, %rax");

    __asm__("syscall");
    __asm__("mov %%eax, %0" : "=r"(fd) : );
    return fd;
}

int main(int argc, char **argv) {

    int fd;
    char buff[SIZE];
    ssize_t readCount;

    if (argc != 2) {
        fprintf(stderr,"Uso correto: %s <nome_do_arquivo>\n", argv[0]);
        return 1;
    }

    // Abertura do arquivo

    fd = myopen(argv[1], O_RDONLY,SIZE);

    printf("%d\n",fd);

    if (fd < 0) {
        perror("File open");
        return 1;
    }

    while ((readCount = myread(fd,buff,SIZE)) > 0) {

        if ( mywrite(STDOUT_FILENO,buff,readCount) != readCount) {
            perror("Write error");
            return 1;
        }

    }

    myclose(fd);

    return 0;
}