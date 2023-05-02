#include <stdio.h>

#define NUM_PROCESSES 3
#define NUM_RESOURCES 3

int main() {
    int max[NUM_PROCESSES][NUM_RESOURCES] = {{3, 6, 8}, {4, 3, 3}, {3, 4, 4}};
    int allocation[NUM_PROCESSES][NUM_RESOURCES] = {{3, 3, 3}, {2, 0, 3}, {1, 2, 4}};
    int available[NUM_RESOURCES] = {1, 2, 0};

    int marked[NUM_PROCESSES] = {0}; // marked[i] = 1 if process i is marked as deadlocked

    // calculate the need matrix
    int need[NUM_PROCESSES][NUM_RESOURCES];
    for (int i = 0; i < NUM_PROCESSES; i++) {
        for (int j = 0; j < NUM_RESOURCES; j++) {
            need[i][j] = max[i][j] - allocation[i][j];
        }
    }

    // check for deadlocked processes
    int done;
    do {
        done = 1;
        for (int i = 0; i < NUM_PROCESSES; i++) {
            if (!marked[i]) {
                int can_be_allocated = 1;
                for (int j = 0; j < NUM_RESOURCES; j++) {
                    if (need[i][j] > available[j]) {
                        can_be_allocated = 0;
                        break;
                    }
                }
                if (can_be_allocated) {
                    marked[i] = 1;
                    done = 0;
                    for (int j = 0; j < NUM_RESOURCES; j++) {
                        available[j] += allocation[i][j];
                    }
                }
            }
        }
    } while (!done);

    // check if the system is in a deadlock state
    int deadlocked = 1;
    for (int i = 0; i < NUM_PROCESSES; i++) {
        if (!marked[i]) {
            deadlocked = 0;
            break;
        }
    }

    // print the results
    if (deadlocked) {
        printf("System is in a deadlock state.\n");
        printf("Deadlocked processes: ");
        for (int i = 0; i < NUM_PROCESSES; i++) {
            if (marked[i]) {
                printf("%d ", i+1);
            }
        }
        printf("\n");
    } else {
        printf("System is not in a deadlock state.\n");
    }

    return 0;
}
