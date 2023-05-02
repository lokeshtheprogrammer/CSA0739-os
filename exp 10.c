#include <stdio.h>

#define NUM_RESOURCES 3
#define NUM_PROCESSES 5

int main() {
    int allocation[NUM_PROCESSES][NUM_RESOURCES] = {
        {1, 1, 2},
        {2, 1, 2},
        {3, 0, 1},
        {0, 2, 0},
        {1, 1, 2}
    };

    int max[NUM_PROCESSES][NUM_RESOURCES] = {
        {5, 4, 4},
        {4, 3, 3},
        {9, 1, 3},
        {8, 6, 4},
        {2, 2, 3}
    };

    int available[NUM_RESOURCES] = {3, 2, 1};

    int need[NUM_PROCESSES][NUM_RESOURCES];

    // Calculate the need matrix
    for(int i = 0; i < NUM_PROCESSES; i++) {
        for(int j = 0; j < NUM_RESOURCES; j++) {
            need[i][j] = max[i][j] - allocation[i][j];
        }
    }

    // Print the need matrix
    printf("Need matrix:\n");
    printf("   A  B  C\n");
    for(int i = 0; i < NUM_PROCESSES; i++) {
        printf("P%d ", i);
        for(int j = 0; j < NUM_RESOURCES; j++) {
            printf("%2d ", need[i][j]);
        }
        printf("\n");
    }

    return 0;
}
