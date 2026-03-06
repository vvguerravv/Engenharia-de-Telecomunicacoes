#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <linux/limits.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include <stdlib.h>


// man 2 cwd
// Returns current working directory (CWD)
int myCwd() {

    char cwd[PATH_MAX];

    if (getcwd(cwd,sizeof(cwd)) != 0) {
        printf("%s\n", cwd);
    } else {
        perror("Unable to get current working directory\n");
        return 1;
    }

    return 0;
}


// man 2 mkdir

int myMkdir(char *name) {

    if (mkdir(name, 0700) != 0) {
        perror("Unable to create directory");
        return 1;
    }

    return 0;
}

int myRmdir(char *name) {

    if (rmdir(name) != 0) {
        perror("Unable to remove directory");
        return 1;
    }

    return 0;
}

int myCd(char *path) {

    if (path == NULL || path[0] == '\0') {
        path = getenv("HOME");
        if (path == NULL) {
            perror("Unable to get home directory");
            return 1;
        }
    }

    if (chdir(path) != 0) {
        perror("Unable to change directory");
        return 1;
    }

    return 0;
}

int myStat(char *file) {

    struct stat st;

    if (stat(file, &st) != 0) {
        perror("Unable to stat file");
        return 1;
    }

    printf("File: %s\n", file);
    printf("Size: %ld bytes\n", st.st_size);
    printf("Permissions: %o\n", st.st_mode & 0777);

    return 0;
}

int myLs(char *dirname) {

    struct dirent *dir;
    DIR *d;

    if (dirname == NULL || dirname[0] == '\0') {
        dirname = ".";
    }

    d = opendir(dirname);

    if (d == NULL) {
        perror("Unable to open directory");
        return 1;
    }

    while ((dir = readdir(d)) != NULL) {
        printf("%s\n", dir->d_name);
    }

    closedir(d);

    return 0;
}

int main (int argc, char** argv) {

    bool teste = true;

    while (teste) {
        char line[256];
        char command[256];
        char arg[256];

        printf("gsh> ");
        if (fgets(line, sizeof(line), stdin) == NULL) {
            break;
        }
        line[strcspn(line, "\n")] = 0;

        int num = sscanf(line, "%s %s", command, arg);
        if (num < 1) continue;
        if (num == 1) arg[0] = '\0';

        if (strcmp(command, "exit") == 0) {
            teste = false;
        } else if (strcmp(command, "myCwd") == 0) {
            myCwd();
        } else if (strcmp(command, "myMkdir") == 0) {
            if (arg[0] == '\0') {
                printf("Missing directory name\n");
            } else {
                myMkdir(arg);
            }
        } else if (strcmp(command, "myRmdir") == 0) {
            if (arg[0] == '\0') {
                printf("Missing directory name\n");
            } else {
                myRmdir(arg);
            }
        } else if (strcmp(command, "myCd") == 0) {
            myCd(arg);
        } else if (strcmp(command, "myStat") == 0) {
            if (arg[0] == '\0') {
                printf("Missing file name\n");
            } else {
                myStat(arg);
            }
        } else if (strcmp(command, "myLs") == 0) {
            myLs(arg);
        } else {
            printf("Invalid command\n");
        }
    }

    return 0;
}