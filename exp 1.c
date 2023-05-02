#include <stdio.h>

int main() {
    int processes = 4;
    int resources = 3;
    int available[3] = {9, 3, 6};
    int claim[4][3] = {
        {3, 2, 2},
        {6, 1, 3},
        {3, 1, 4},
        {4, 2, 2}
    };
    int allocation[4][3] = {
        {1, 0, 0},
        {6, 1, 2},
        {2, 1, 1},
        {0, 0, 2}
    };
    int work[3];
    int finish[4] = {0, 0, 0, 0};
    int safe_sequence[4];
    int count = 0;
    int i, j;

    for (i = 0; i < resources; i++) {
        work[i] = available[i];
    }

    while (count < processes) {
        int found = 0;
        for (i = 0; i < processes; i++) {
            if (finish[i] == 0) {
                int can_be_allocated = 1;
                for (j = 0; j < resources; j++) {
                    if (claim[i][j] - allocation[i][j] > work[j]) {
                        can_be_allocated = 0;
                        break;
                    }
                }
                if (can_be_allocated) {
                    for (j = 0; j < resources; j++) {
                        work[j] += allocation[i][j];
                    }
                    finish[i] = 1;
                    safe_sequence[count] = i;
                    count++;
                    found = 1;
                }
            }
        }
        if (!found) {
            printf("The system is in an unsafe state.\n");
            return 0;
        }
    }
    printf("The system is in a safe state. Safe sequence is: ");
    for (i = 0; i < processes; i++) {
        printf("%d ", safe_sequence[i]);
    }
    printf("\n");
    return 0;
}
