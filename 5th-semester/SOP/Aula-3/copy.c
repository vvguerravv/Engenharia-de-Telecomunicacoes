//
// // Import de bibliotecas
//
// #include <stdio.h>
// #include <fcntl.h>
// #include <unistd.h>
//
// // Definições de variáveis
//
// #define SIZE 128
//
// int myopen(const char *filename, int flags, size_t buffersize) {
//     return open(filename, flags);
// }
//
// int myread(int fd, void *buff, size_t count) {
//     return read(fd,buff,count);
// }
//
// int mywrite(int fd, void *buff, size_t count) {
//     return write(fd,buff,count);
// }
//
// int myclose(int fd) {
//     return close(fd);
// }
//
// int main(int argc, char **argv) {
//
//     int fd;
//     char buff[SIZE];
//     ssize_t readCount;
//
//     if (argc != 2) {
//         fprintf(stderr,"Uso correto: %s <nome_do_arquivo>\n", argv[0]);
//         return 1;
//     }
//
//     // Abertura do arquivo
//
//     fd = myopen(argv[1], O_RDONLY,SIZE);
//
//     if (fd < 0) {
//         perror("File open");
//         return 1;
//     }
//
//     while ((readCount = myread(fd,buff,SIZE)) > 0) {
//
//         if ( mywrite(STDOUT_FILENO,buff,readCount) != readCount) {
//             perror("Write error");
//             return 1;
//         }
//
//     }
//
//     myclose(fd);
//
//     return 0;
// }