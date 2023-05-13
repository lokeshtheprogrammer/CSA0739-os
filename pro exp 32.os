#include<stdio.h>
#include<stdlib.h>

#define MAX 100

void sort(int arr[], int n) {
    int i, j, temp;
    for (i = 0; i < n - 1; i++) {
        for (j = i + 1; j < n; j++) {
            if (arr[i] > arr[j]) {
                temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
}

int main() {
    int n, head_pos, i, j, seek_time = 0, diff, max;
    float avg_seek_time;
    int queue[MAX];

    printf("Enter the number of tracks: ");
    scanf("%d", &n);

    printf("Enter the track position of the disk head: ");
    scanf("%d", &head_pos);

    printf("Enter the track positions of requests: ");
    for (i = 0; i < n; i++) {
        scanf("%d", &queue[i]);
    }

    sort(queue, n);

    max = queue[n-1];

    printf("Head movement:\n%d -> ", head_pos);

    for (i = 0; i < n; i++) {
        if (queue[i] < head_pos) {
            printf("%d -> ", queue[i]);
        }
    }

    printf("0 -> ");

    for (i = n - 1; i >= 0; i--) {
        if (queue[i] >= head_pos) {
            printf("%d -> ", queue[i]);
        }
    }

    printf("%d\n", max);

    diff = max - head_pos;
    seek_time = diff;

    for (i = 0; i < n; i++) {
        seek_time += abs(queue[i] - head_pos);
        head_pos = queue[i];
    }

    avg_seek_time = (float)seek_time / n;
    printf("Average head movement: %0.2f\n", avg_seek_time);

    return 0;
}
