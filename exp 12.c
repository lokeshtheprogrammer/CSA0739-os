#include <stdio.h>
#include <stdlib.h>

#define NUM_PARTITIONS 6
#define NUM_PROCESSES 5

int main() {
    int partitions[NUM_PARTITIONS] = { 300, 600, 350, 200, 750, 125 };
    int processes[NUM_PROCESSES] = { 115, 500, 358, 200, 375 };
    int allocation[NUM_PROCESSES] = { -1, -1, -1, -1, -1 };  // -1 means unallocated
    int i, j;

    // iterate through each process and allocate memory using the best-fit algorithm
    for (i = 0; i < NUM_PROCESSES; i++) {
        int best_partition_index = -1;
        for (j = 0; j < NUM_PARTITIONS; j++) {
            if (partitions[j] >= processes[i]) {
                if (best_partition_index == -1 || partitions[j] < partitions[best_partition_index]) {
                    best_partition_index = j;
                }
            }
        }
        // allocate the process to the best-fit partition
        if (best_partition_index != -1) {
            allocation[i] = best_partition_index;
            partitions[best_partition_index] -= processes[i];
        }
    }

    // print the allocation results
    printf("Process No.\tProcess Size\tPartition No.\n");
    for (i = 0; i < NUM_PROCESSES; i++) {
        printf("%d\t\t%d\t\t", i+1, processes[i]);
        if (allocation[i] != -1) {
            printf("%d\n", allocation[i]+1);
        } else {
            printf("Not Allocated\n");
        }
    }

    return 0;
}
