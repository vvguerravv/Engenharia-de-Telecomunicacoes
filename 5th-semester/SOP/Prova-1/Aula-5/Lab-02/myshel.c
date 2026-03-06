#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <linux/limits.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include <stdlib.h>
#include <time.h>

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
// Creates a new directory

int myMkdir() {

    char name[256];

    if (scanf("%s", name) != 1) {
        printf("Missing directory name\n");
        return 1;
    }

    if (mkdir(name, 0700) != 0) {
        perror("Unable to create directory");
        return 1;
    }

    return 0;
}


// man 2 rmdir
// Removes a directory

int myRmdir() {

    char name[256];

    if (scanf("%s", name) != 1) {
        printf("Missing directory name\n");
        return 1;
    }

    if (rmdir(name) != 0) {
        perror("Unable to remove directory");
        return 1;
    }

    return 0;
}


// man 2 chdir
// Changes the current working directory

int myCd() {

    char path[256];

    if (scanf("%s", path) != 1) {
        printf("Missing directory name\n");
        return 1;
    }

    if (chdir(path) != 0) {
        perror("Unable to change directory");
        return 1;
    }

    return 0;
}


// man 2 stat
// Displays file metadata (size and permissions)

#include <time.h>

int myStat() {

    char file[256];
    struct stat st;

    if (scanf("%s", file) != 1) {
        printf("Missing file name\n");
        return 1;
    }

    if (stat(file, &st) != 0) {
        perror("Unable to stat file");
        return 1;
    }

    printf("File: %s\n", file);
    printf("Size: %ld bytes\n", st.st_size);
    printf("Permissions: %o\n", st.st_mode & 0777);

    char buffer[100];
    struct tm *tm_info;

    tm_info = localtime(&st.st_atime);
    strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", tm_info);
    printf("Access: %s\n", buffer);

    tm_info = localtime(&st.st_mtime);
    strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", tm_info);
    printf("Modify: %s\n", buffer);

    tm_info = localtime(&st.st_ctime);
    strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", tm_info);
    printf("Change: %s\n", buffer);

    return 0;
}


// man 3 readdir
// Lists entries in the current directory

int myLs() {

    struct dirent *dir;
    DIR *d;

    d = opendir(".");

    if (d == NULL) {
        perror("Unable to open directory");
        return 1;
    }

    while ((dir = readdir(d)) != NULL) {
        if (strcmp(dir->d_name, ".") == 0 || strcmp(dir->d_name, "..") == 0) {
            continue;
        }

        printf("%s\n", dir->d_name);
    }

    closedir(d);

    return 0;
}

int main (int argc, char** argv) {

    bool teste = true;

    while (teste) {
        char command[256];

        printf("gsh> ");
        if (scanf("%s", command) != 1) {
            break;
        }

        if (strcmp(command, "exit") == 0) {
            teste = false;
        } 
        
        else if (strcmp(command, "myCwd") == 0) {
            myCwd();
        } 
        
        else if (strcmp(command, "myMkdir") == 0) {
            myMkdir();
        } 
        
        else if (strcmp(command, "myRmdir") == 0) {
            myRmdir();
        } 
        
        else if (strcmp(command, "myCd") == 0) {
            myCd();
        } 
        
        else if (strcmp(command, "myStat") == 0) {
            myStat();
        } 
        
        else if (strcmp(command, "myLs") == 0) {
            myLs();
        } else {
            printf("Invalid command\n");
        }
    }

    return 0;
}