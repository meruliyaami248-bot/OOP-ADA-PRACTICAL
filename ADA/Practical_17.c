#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>

int main(int argc, char *argv[]) {
    DIR *dir;
    struct dirent *entry;
    char *path;

    // If no directory is given, use current directory
    if (argc == 1) {
        path = ".";
    } else {
        path = argv[1];
    }

    // Open directory
    dir = opendir(path);
    if (dir == NULL) {
        perror("Unable to open directory");
        return 1;
    }

    // Read and print directory entries
    while ((entry = readdir(dir)) != NULL) {
        printf("%s\n", entry->d_name);
    }

    // Close directory
    closedir(dir);

    return 0;
}
