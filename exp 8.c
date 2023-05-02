#include <stdio.h>
#include <stdlib.h>

#define MAX_QUEUE 100

int abs(int a) {
    return (a < 0) ? -a : a;
}

int main() {
    int queue[MAX_QUEUE];
    int head, num_requests, total_head_movement;

    // get the number of requests and the initial head position
    printf("Enter the number of requests: ");
    scanf("%d", &num_requests);

    printf("Enter the initial head position: ");
    scanf("%d", &head);

    // get the request queue
    printf("Enter the request queue:\n");
    for (int i = 0; i < num_requests; i++) {
        scanf("%d", &queue[i]);
    }

    // initialize total head movement to the initial head position
    total_head_movement = abs(queue[0] - head);

    // iterate through the request queue and calculate the head movement
    for (int i = 1; i < num_requests; i++) {
        total_head_movement += abs(queue[i] - queue[i-1]);
    }

    // print the results
    printf("Total head movement: %d\n", total_head_movement);
    printf("Average head movement: %f\n", (float)total_head_movement / num_requests);

    return 0;
}
