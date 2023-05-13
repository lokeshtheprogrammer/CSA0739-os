#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX 100

int main()
{
    int n, head, i, j, k, seek_time = 0, diff, max;
    float avg_seek_time;
    int queue[MAX], done[MAX];

    printf("Enter the number of requests: ");
    scanf("%d", &n);

    printf("Enter the requests: ");
    for (i = 0; i < n; i++)
        scanf("%d", &queue[i]);

    printf("Enter the initial head position: ");
    scanf("%d", &head);

    queue[n] = head;
    n++;

    // Sorting the queue in ascending order
    for (i = 0; i < n; i++) {
        for (j = i + 1; j < n; j++) {
            if (queue[i] > queue[j]) {
                int temp = queue[i];
                queue[i] = queue[j];
                queue[j] = temp;
            }
        }
    }

    // Finding the position of head in the sorted queue
    for (i = 0; i < n; i++) {
        if (head == queue[i]) {
            k = i;
            break;
        }
    }

    // Scanning towards right
    for (i = k; i < n - 1; i++) {
        diff = abs(queue[i + 1] - queue[i]);
        seek_time += diff;
        printf("%d -> ", queue[i]);
    }

    // Add the max track number to seek_time
    diff = abs(queue[n - 1] - queue[0]);
    seek_time += diff;
    printf("%d -> %d -> ", queue[n - 1], queue[0]);

    // Scanning towards left
    for (i = 0; i < k - 1; i++) {
        diff = abs(queue[i + 1] - queue[i]);
        seek_time += diff;
        printf("%d -> ", queue[i]);
    }
    printf("%d\n", queue[i]);

    avg_seek_time = (float)seek_time / n;

    printf("Total head movement: %d\n", seek_time);
    printf("Average head movement: %0.2f\n", avg_seek_time);

    return 0;
}
