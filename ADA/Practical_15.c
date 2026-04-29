#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int n, i;
    pid_t pid;

    printf("Enter the number of child processes to create: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Please enter a positive number.\n");
        return 1;
    }

    for (i = 0; i < n; i++) {
        pid = fork();

        if (pid < 0) {
            // Fork failed
            perror("Fork failed");
            exit(1);
        } 
        else if (pid == 0) {
            // Child process
            printf("Child %d: PID = %d, Parent PID = %d\n",
                   i + 1, getpid(), getppid());
            exit(0);  // Child exits to prevent further forking
        }
        // Parent continues loop
    }

    // Parent waits for all children
    for (i = 0; i < n; i++) {
        wait(NULL);
    }

    printf("All child processes created and terminated successfully.\n");

    return 0;
}
