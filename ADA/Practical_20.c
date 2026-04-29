#include <stdio.h>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

#define SHM_SIZE sizeof(int)

int main() {
    int shmid;
    int *shared_var;
    pid_t pid;

    shmid = shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | 0666);
    if (shmid < 0) {
        perror("shmget failed");
        exit(1);
    }

    shared_var = (int *)shmat(shmid, NULL, 0);
    if (shared_var == (int *) -1) {
        perror("shmat failed");
        exit(1);
    }

    pid = fork();

    if (pid < 0) {
        perror("fork failed");
        exit(1);
    }

    if (pid == 0) {
        sleep(1);
        printf("Child: Value read from shared memory = %d\n", *shared_var);

        *shared_var += 10;
        printf("Child: Value after modification = %d\n", *shared_var);

        shmdt(shared_var);
        exit(0);
    } 
    else {
        *shared_var = 100;
        printf("Parent: Value written to shared memory = %d\n", *shared_var);

        wait(NULL);

        printf("Parent: Final value in shared memory = %d\n", *shared_var);

        shmdt(shared_var);
        shmctl(shmid, IPC_RMID, NULL);
    }

    return 0;
}
