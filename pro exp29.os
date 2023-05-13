#include <stdio.h>
#include <stdbool.h>

#define NUM_PARTITIONS 4
#define NUM_PROCESSES 5

int main() {
    int partitions[NUM_PARTITIONS] = {40, 10, 30, 60}; // memory partitions
    int processes[NUM_PROCESSES] = {100, 50, 30, 120, 35}; // process sizes
    int allocation[NUM_PROCESSES] = {-1}; // -1 indicates process is not allocated
    bool allocated[NUM_PARTITIONS] = {false}; // whether each partition is allocated

    for (int i = 0; i < NUM_PROCESSES; i++) {
        for (int j = 0; j < NUM_PARTITIONS; j++) {
            if (!allocated[j] && partitions[j] >= processes[i]) {
                allocation[i] = j; // allocate process i to partition j
                allocated[j] = true; // mark partition j as allocated
                partitions[j] -= processes[i]; // update remaining space in partition j
                break; // go to the next process
            }
        }
    }

    // print allocation
    printf("Process No.\tProcess Size\tAllocated Partition No.\n");
    for (int i = 0; i < NUM_PROCESSES; i++) {
        printf("%d\t\t%d\t\t", i+1, processes[i]);
        if (allocation[i] != -1) {
            printf("%d\n", allocation[i]+1);
        } else {
            printf("Not Allocated\n");
        }
    }

    return 0;
}
