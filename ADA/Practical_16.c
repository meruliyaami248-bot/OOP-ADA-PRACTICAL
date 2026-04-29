#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define SIZE 1000000   // Large array size

int A[SIZE], B[SIZE];
int Sum[SIZE], Diff[SIZE];

// Thread function for addition
void* addition(void* arg) {
    for (int i = 0; i < SIZE; i++) {
        Sum[i] = A[i] + B[i];
    }
    pthread_exit(NULL);
}

// Thread function for subtraction
void* subtraction(void* arg) {
    for (int i = 0; i < SIZE; i++) {
        Diff[i] = A[i] - B[i];
    }
    pthread_exit(NULL);
}

int main() {
    pthread_t thread1, thread2;

    // Initialize arrays with sample values
    for (int i = 0; i < SIZE; i++) {
        A[i] = i;
        B[i] = SIZE - i;
    }

    // Create addition thread
    if (pthread_create(&thread1, NULL, addition, NULL) != 0) {
        perror("Failed to create addition thread");
        return 1;
    }

    // Create subtraction thread
    if (pthread_create(&thread2, NULL, subtraction, NULL) != 0) {
        perror("Failed to create subtraction thread");
        return 1;
    }

    // Wait for both threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    printf("Addition and Subtraction completed successfully.\n");

    // Print first 5 results as verification
    printf("\nFirst 5 Results:\n");
    for (int i = 0; i < 5; i++) {
        printf("A[%d]=%d, B[%d]=%d, Sum=%d, Diff=%d\n",
               i, A[i], i, B[i], Sum[i], Diff[i]);
    }

    return 0;
}
